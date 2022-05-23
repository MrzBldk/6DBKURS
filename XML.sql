CREATE OR REPLACE DIRECTORY APP_CONTAINER AS 'C:/app';

create or replace procedure ExportManufacturersXML AS
    DOC DBMS_XMLDOM.DOMDocument;
    XDATA XMLTYPE;
    CURSOR XMLCUR IS
    SELECT XMLELEMENT("MANUFACTURERS",
    XMLAttributes('http://www.w3.org/2001/XMLSchema' AS "xmlns:xsi",
    'http://www.oracle.com/Users.xsd' AS "xsi:nonamespaceSchemaLocation"),
    XMLAGG(XMLELEMENT("MANUFACTURER",
    xmlelement("ID", MANUFACTURER.ID),
    xmlelement("NAME", MANUFACTURER.NAME),
    xmlelement("ADDRESS", MANUFACTURER.ADDRESS),
    xmlelement("PHONE_NUMBER", MANUFACTURER.PHONE_NUMBER)
    ))) from MANUFACTURERS;
begin
    open xmlcur;
    loop
        fetch xmlcur into xdata;
        exit when xmlcur%notfound;
    end loop;
    close xmlcur;

    DOC := DBMS_XMLDOM.NewDOMDocument(XDATA);
    DBMS_XMLDOM.WRITETOFILE(DOC, 'APP_CONTAINER/MANUFACTURERS.xml');
END;

begin
    ExportManufacturersXML();
end;

CREATE OR REPLACE PROCEDURE ImportManufacturersXml AS
    L_CLOB CLOB;
    L_BFILE BFILE := BFILENAME('APP_CONTAINER', 'MANUFACTURERS.xml');

    L_DEST_OFFSET INTEGER := 1;
    L_SRC_OFFSET INTEGER := 1;
    L_BFILE_CSID NUMBER := 0;
    L_LANG_CONTEXT INTEGER := 0;
    L_WARNING INTEGER := 0;

    P DBMS_XMLPARSER.PARSER;
    v_doc dbms_xmldom.domdocument;
    v_root_element dbms_xmldom.domelement;
    V_CHILD_NODES DBMS_XMLDOM.DOMNODELIST;
    V_CURRENT_NODE DBMS_XMLDOM.DOMNODE;

    et MANUFACTURERS%rowtype;
begin
    DBMS_LOB.CREATETEMPORARY (L_CLOB, TRUE);
    DBMS_LOB.FILEOPEN(L_BFILE, DBMS_LOB.FILE_READONLY);

    DBMS_LOB.LOADCLOBFROMFILE (DEST_LOB => L_CLOB, SRC_BFILE => L_BFILE, AMOUNT => DBMS_LOB.LOBMAXSIZE,
    DEST_OFFSET => L_DEST_OFFSET, SRC_OFFSET => L_SRC_OFFSET, BFILE_CSID => L_BFILE_CSID,
    LANG_CONTEXT => L_LANG_CONTEXT, WARNING => L_WARNING);
    DBMS_LOB.FILECLOSE(L_BFILE);
    COMMIT;

    P := Dbms_Xmlparser.Newparser;
    DBMS_XMLPARSER.PARSECLOB(P, L_CLOB);
    V_DOC := DBMS_XMLPARSER.GETDOCUMENT(P);
    V_ROOT_ELEMENT := DBMS_XMLDOM.Getdocumentelement(v_Doc);
    V_CHILD_NODES := DBMS_XMLDOM.GETCHILDRENBYTAGNAME(V_ROOT_ELEMENT,'*');

    FOR i IN 0 .. DBMS_XMLDOM.GETLENGTH(V_CHILD_NODES) - 1
    LOOP
        V_CURRENT_NODE := DBMS_XMLDOM.ITEM(V_CHILD_NODES,i);

        DBMS_XSLPROCESSOR.VALUEOF(V_CURRENT_NODE,
        'ID/text()',et.ID);
        DBMS_XSLPROCESSOR.VALUEOF(V_Current_Node,
        'NAME/text()',et.NAME);
        DBMS_XSLPROCESSOR.VALUEOF(V_Current_Node,
        'ADDRESS/text()',et.ADDRESS);
        DBMS_XSLPROCESSOR.VALUEOF(v_current_node,
        'PHONE_NUMBER/text()',et.PHONE_NUMBER);

        INSERT INTO MANUFACTURERS(NAME, ADDRESS, PHONE_NUMBER)
        VALUES(et.NAME, et.ADDRESS, et.PHONE_NUMBER);
    END LOOP;

    DBMS_LOB.FREETEMPORARY(L_CLOB);
    DBMS_XMLPARSER.FREEPARSER(P);
    DBMS_XMLDOM.FREEDOCUMENT(V_DOC);
    COMMIT;
END; 

BEGIN
    ImportManufacturersXml();
END;

SELECT * FROM MANUFACTURERS;

DROP PROCEDURE ExportManufacturersXML;
DROP PROCEDURE ImportManufacturersXml;