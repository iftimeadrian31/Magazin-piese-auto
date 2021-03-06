-- Generated by Oracle SQL Developer Data Modeler 20.2.0.167.1538
--   at:        2020-12-10 22:59:54 EET
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE becuri (
    id_piesa            NUMBER(8) NOT NULL,
    intrebuintare_bec   VARCHAR2(11) NOT NULL,
    tip_bec             VARCHAR2(12) NOT NULL,
    flux_luminos_bec    NUMBER(4) NOT NULL,
    durata_medie_viata  VARCHAR2(40) NOT NULL,
    consum_energie_bec  VARCHAR2(40) NOT NULL
)
LOGGING;

ALTER TABLE becuri
    ADD CONSTRAINT intrebuintare_ck CHECK ( intrebuintare_bec IN ( 'far', 'semnalizare', 'stop' ) );

ALTER TABLE becuri
    ADD CONSTRAINT tip_bec_ck CHECK ( tip_bec IN ( 'halogen', 'incandescent', 'led' ) );

ALTER TABLE becuri
    ADD CONSTRAINT flux_luminos_ck CHECK ( flux_luminos_bec BETWEEN 0 AND 3000 );

ALTER TABLE becuri ADD CONSTRAINT durata_viata_ck CHECK ( durata_medie_viata > 0 );

ALTER TABLE becuri ADD CONSTRAINT consum_energie_ck CHECK ( consum_energie_bec > 0 );

CREATE UNIQUE INDEX becuri__idx ON
    becuri (
        id_piesa
    ASC )
        LOGGING;

CREATE TABLE combinatii_posibile (
    id_masina  NUMBER(3) NOT NULL,
    id_piesa   NUMBER(4) NOT NULL
)
LOGGING;

ALTER TABLE combinatii_posibile ADD CONSTRAINT combinatii_posibile_pk PRIMARY KEY ( id_piesa,
                                                                                    id_masina );

CREATE TABLE detalii_masini (
    id_masina              NUMBER(6) NOT NULL,
    cod_model              VARCHAR2(10),
    an_fabricatie_model    NUMBER(4) NOT NULL,
    capacitate_cilindrica  NUMBER(4) NOT NULL,
    tip_carburant          VARCHAR2(7) NOT NULL,
    putere_motor           NUMBER(4) NOT NULL
)
LOGGING;

ALTER TABLE detalii_masini
    ADD CONSTRAINT an_ck CHECK ( an_fabricatie_model BETWEEN 1000 AND 3000 );

ALTER TABLE detalii_masini
    ADD CONSTRAINT capacitate_cilindrica_ck CHECK ( capacitate_cilindrica BETWEEN 50 AND 6800 );

ALTER TABLE detalii_masini
    ADD CONSTRAINT tip_carburant_ck CHECK ( tip_carburant IN ( 'Benzina', 'Diesel', 'GPL' ) );

ALTER TABLE detalii_masini
    ADD CONSTRAINT putere_ck CHECK ( putere_motor BETWEEN 0 AND 4600 );

ALTER TABLE detalii_masini ADD CONSTRAINT detalii_masini_pk PRIMARY KEY ( id_masina );

CREATE TABLE masini (
    id_masina     NUMBER(3) NOT NULL,
    marca_masina  VARCHAR2(40) NOT NULL,
    model_masina  VARCHAR2(40) NOT NULL
)
LOGGING;

ALTER TABLE masini ADD CONSTRAINT masini_pk PRIMARY KEY ( id_masina );

ALTER TABLE masini ADD CONSTRAINT marca_model UNIQUE ( marca_masina,
                                                       model_masina );

CREATE TABLE parbrize (
    id_piesa           NUMBER(6) NOT NULL,
    senzori_ploaie     CHAR(2) NOT NULL,
    senzori_lumina     CHAR(2) NOT NULL,
    camera             CHAR(2) NOT NULL,
    grad_transparenta  NUMBER(2) NOT NULL
)
LOGGING;

ALTER TABLE parbrize
    ADD CONSTRAINT senzori_ploaie_ck CHECK ( senzori_ploaie IN ( 'Da', 'Nu' ) );

ALTER TABLE parbrize
    ADD CONSTRAINT senzori_lumina_ck CHECK ( senzori_lumina IN ( 'Da', 'Nu' ) );

ALTER TABLE parbrize
    ADD CONSTRAINT camera_ck CHECK ( camera IN ( 'Da', 'Nu' ) );

ALTER TABLE parbrize
    ADD CONSTRAINT grad_transparenta_ck CHECK ( grad_transparenta BETWEEN 0 AND 50 );

CREATE UNIQUE INDEX parbrize__idx ON
    parbrize (
        id_piesa
    ASC )
        LOGGING;

CREATE TABLE piese (
    id_piesa        NUMBER(4) NOT NULL,
    denumire_piesa  VARCHAR2(40) NOT NULL,
    pret_piesa      NUMBER(5) NOT NULL,
    cantitate       NUMBER(3) DEFAULT 0
)
LOGGING;

ALTER TABLE piese ADD CONSTRAINT pret_ck CHECK ( pret_piesa > 0 );

ALTER TABLE piese ADD CONSTRAINT cantitate_ck CHECK ( cantitate >= 0 );

ALTER TABLE piese ADD CONSTRAINT piese_pk PRIMARY KEY ( id_piesa );

CREATE TABLE piese_caroserie (
    id_piesa            NUMBER(8) NOT NULL,
    culoare_caroserie   VARCHAR2(40) NOT NULL,
    material_caroserie  VARCHAR2(40) NOT NULL
)
LOGGING;

CREATE UNIQUE INDEX piese_caroserie__idx ON
    piese_caroserie (
        id_piesa
    ASC )
        LOGGING;

CREATE TABLE tranzactii (
    id_tranzactie             NUMBER(4) NOT NULL,
    id_piesa                  NUMBER(8) NOT NULL,
    tip_tranzactie            VARCHAR2(1) NOT NULL,
    data_tranzactie           DATE NOT NULL,
    cantitate_tranzactionata  NUMBER(3) NOT NULL
)
LOGGING;

ALTER TABLE tranzactii
    ADD CONSTRAINT tip_tranzactie_ck CHECK ( tip_tranzactie IN ( 'I', 'O' ) );

ALTER TABLE tranzactii ADD CONSTRAINT vanzari_pk PRIMARY KEY ( id_tranzactie );

CREATE TABLE ulei (
    id_piesa           NUMBER(8) NOT NULL,
    producator_ulei    VARCHAR2(40) NOT NULL,
    clasa_vascozitate  VARCHAR2(40) NOT NULL,
    capacitate         NUMBER(3) NOT NULL
)
LOGGING;

ALTER TABLE ulei
    ADD CONSTRAINT producator_ulei_ck CHECK ( producator_ulei IN ( 'Castrol', 'Liqui-Moly', 'Motul' ) );

ALTER TABLE ulei
    ADD CONSTRAINT capacitate_ck CHECK ( capacitate BETWEEN 1 AND 5 );

CREATE UNIQUE INDEX ulei__idx ON
    ulei (
        id_piesa
    ASC )
        LOGGING;

ALTER TABLE combinatii_posibile
    ADD CONSTRAINT combinatii_posibile_masini_fk FOREIGN KEY ( id_masina )
        REFERENCES masini ( id_masina )
    NOT DEFERRABLE;

ALTER TABLE combinatii_posibile
    ADD CONSTRAINT combinatii_posibile_piese_fk FOREIGN KEY ( id_piesa )
        REFERENCES piese ( id_piesa )
    NOT DEFERRABLE;

ALTER TABLE detalii_masini
    ADD CONSTRAINT masini_detalii_fk FOREIGN KEY ( id_masina )
        REFERENCES masini ( id_masina )
    NOT DEFERRABLE;

ALTER TABLE becuri
    ADD CONSTRAINT piese_becuri_fk FOREIGN KEY ( id_piesa )
        REFERENCES piese ( id_piesa )
    NOT DEFERRABLE;

ALTER TABLE piese_caroserie
    ADD CONSTRAINT piese_caroserie_fk FOREIGN KEY ( id_piesa )
        REFERENCES piese ( id_piesa )
    NOT DEFERRABLE;

ALTER TABLE parbrize
    ADD CONSTRAINT piese_parbrize_fk FOREIGN KEY ( id_piesa )
        REFERENCES piese ( id_piesa )
    NOT DEFERRABLE;

ALTER TABLE tranzactii
    ADD CONSTRAINT piese_tranzactii_fk FOREIGN KEY ( id_piesa )
        REFERENCES piese ( id_piesa )
    NOT DEFERRABLE;

ALTER TABLE ulei
    ADD CONSTRAINT piese_ulei_fk FOREIGN KEY ( id_piesa )
        REFERENCES piese ( id_piesa )
    NOT DEFERRABLE;

CREATE OR REPLACE TRIGGER trg_Tranzactii_BRIU 
    BEFORE INSERT OR UPDATE ON Tranzactii 
    FOR EACH ROW 
BEGIN
	IF (:new.data_tranzactie >= SYSDATE )
	THEN
		RAISE_APPLICATION_ERROR( -20001,
			'Data invalida: ' || TO_CHAR( :new.data_tranzactie, 'DD.MM.YYYY HH24:MI:SS' ) || ' trebuie sa fie mai mica decat data curenta.' );
	END IF;
END; 
/

CREATE SEQUENCE masini_id_masina_seq START WITH 1 MAXVALUE 999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER masini_id_masina_trg BEFORE
    INSERT ON masini
    FOR EACH ROW
    WHEN ( new.id_masina IS NULL )
BEGIN
    :new.id_masina := masini_id_masina_seq.nextval;
END;
/

CREATE SEQUENCE piese_id_piesa_seq START WITH 1 MAXVALUE 9999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER piese_id_piesa_trg BEFORE
    INSERT ON piese
    FOR EACH ROW
    WHEN ( new.id_piesa IS NULL )
BEGIN
    :new.id_piesa := piese_id_piesa_seq.nextval;
END;
/

CREATE SEQUENCE tranzactii_id_tranzactie_seq START WITH 1 MAXVALUE 9999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tranzactii_id_tranzactie_trg BEFORE
    INSERT ON tranzactii
    FOR EACH ROW
    WHEN ( new.id_tranzactie IS NULL )
BEGIN
    :new.id_tranzactie := tranzactii_id_tranzactie_seq.nextval;
END;
/



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             9
-- CREATE INDEX                             4
-- ALTER TABLE                             32
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           4
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          3
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
