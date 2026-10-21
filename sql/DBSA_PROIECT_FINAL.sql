-- Tabele
CREATE TABLE FURNIZORI (
    ID_furnizor INT PRIMARY KEY,
    nume_furnizor VARCHAR(100) NOT NULL,
    telefon VARCHAR(15),
    firma VARCHAR(100) NOT NULL
);

CREATE TABLE MATERIALE (
    ID_material INT PRIMARY KEY,
    nume VARCHAR(100) NOT NULL,
    pret DECIMAL(10, 2),
    cantitate INT,
    ID_furnizor INT,
    CONSTRAINT FK_FurnizorMaterial FOREIGN KEY (ID_furnizor) REFERENCES FURNIZORI(ID_furnizor)
);

CREATE TABLE MATERIALE_AUXILIARE (
    ID_material_auxiliar INT PRIMARY KEY,
    nume VARCHAR(100) NOT NULL,
    pret DECIMAL(10, 2),
    cantitate INT,
    ID_furnizor INT,
    CONSTRAINT FK_FurnizorMaterialAuxiliar FOREIGN KEY (ID_furnizor) REFERENCES FURNIZORI(ID_furnizor)
);

CREATE TABLE SCULE (
    ID_scula INT PRIMARY KEY,
    nume VARCHAR(100) NOT NULL,
    pret DECIMAL(10, 2),
    cantitate INT,
    ID_furnizor INT,
    CONSTRAINT FK_FurnizorScula FOREIGN KEY (ID_furnizor) REFERENCES FURNIZORI(ID_furnizor)
);

CREATE TABLE SERVICII (
    ID_serviciu INT PRIMARY KEY,
    nume_serviciu VARCHAR(100) NOT NULL,
    data_prestarii DATE,
    ID_furnizor INT,
    CONSTRAINT FK_FurnizorServiciu FOREIGN KEY (ID_furnizor) REFERENCES FURNIZORI(ID_furnizor)
);

CREATE TABLE SECTOARE (
    ID_sector INT PRIMARY KEY,
    nume_sector VARCHAR(100) NOT NULL,
    buget_anual DECIMAL(15, 2)
);

CREATE TABLE BUGETE (
    ID_buget INT PRIMARY KEY,
    an INT NOT NULL,
    suma_alocata DECIMAL(15, 2),
    ID_sector INT,
    CONSTRAINT FK_SectorBuget FOREIGN KEY (ID_sector) REFERENCES SECTOARE(ID_sector)
);

CREATE TABLE RAPOARTE_FINANCIARE (
    ID_raport INT PRIMARY KEY,
    luna INT NOT NULL,
    total_cheltuieli DECIMAL(15, 2),
    profit DECIMAL(15, 2),
    ID_sector INT,
    CONSTRAINT FK_SectorRaport FOREIGN KEY (ID_sector) REFERENCES SECTOARE(ID_sector)
);

CREATE TABLE ALTE_CHELTUIELI (
    ID_alte_cheltuieli INT PRIMARY KEY,
    denumire VARCHAR(100) NOT NULL,
    valoare DECIMAL(10, 2),
    data DATE
);

CREATE TABLE CHELTUIELI_LUNARE (
    ID_cheltuiala INT PRIMARY KEY,
    luna INT NOT NULL,
    an INT NOT NULL,
    ID_material INT,
    ID_material_auxiliar INT,
    ID_scula INT,
    ID_serviciu INT,
    ID_sector INT,
    ID_alte_cheltuieli INT,
    CONSTRAINT FK_MaterialCheltuiala FOREIGN KEY (ID_material) REFERENCES MATERIALE(ID_material),
    CONSTRAINT FK_MaterialAuxiliarCheltuiala FOREIGN KEY (ID_material_auxiliar) REFERENCES MATERIALE_AUXILIARE(ID_material_auxiliar),
    CONSTRAINT FK_SculaCheltuiala FOREIGN KEY (ID_scula) REFERENCES SCULE(ID_scula),
    CONSTRAINT FK_ServiciuCheltuiala FOREIGN KEY (ID_serviciu) REFERENCES SERVICII(ID_serviciu),
    CONSTRAINT FK_SectorCheltuiala FOREIGN KEY (ID_sector) REFERENCES SECTOARE(ID_sector),
    CONSTRAINT FK_AlteCheltuieli FOREIGN KEY (ID_alte_cheltuieli) REFERENCES ALTE_CHELTUIELI(ID_alte_cheltuieli)
);

-- Date de test
INSERT INTO FURNIZORI VALUES (1, 'Furnizor A', '0123456789', 'Compania A');
INSERT INTO FURNIZORI VALUES (2, 'Furnizor B', '0987654321', 'Compania B');
INSERT INTO FURNIZORI VALUES (3, 'Furnizor C', '0234567890', 'Compania C');
INSERT INTO FURNIZORI VALUES (4, 'Furnizor D', '0321654987', 'Compania D');

INSERT INTO MATERIALE VALUES (1, 'Placi Rigips', 50.00, 100, 2);
INSERT INTO MATERIALE VALUES (2, 'Tije Metalice', 20.00, 200, 2);
INSERT INTO MATERIALE VALUES (3, 'Cabluri Electrice', 5.00, 500, 3);
INSERT INTO MATERIALE VALUES (4, 'Placi Policarbonat', 120.00, 50, 1);

INSERT INTO MATERIALE_AUXILIARE VALUES (1, 'Adeziv Placi', 10.00, 300, 2);
INSERT INTO MATERIALE_AUXILIARE VALUES (2, 'Banda Izolatoare', 2.50, 1000, 3);
INSERT INTO MATERIALE_AUXILIARE VALUES (3, 'Silicon Transparent', 15.00, 150, 1);
INSERT INTO MATERIALE_AUXILIARE VALUES (4, 'Spray Impermeabilizant', 25.00, 80, 4);

INSERT INTO SCULE VALUES (1, 'Masina de Gaurit', 450.00, 10, 1);
INSERT INTO SCULE VALUES (2, 'Fierastrau Circular', 600.00, 5, 2);
INSERT INTO SCULE VALUES (3, 'Masina de Slefuit', 250.00, 8, 3);
INSERT INTO SCULE VALUES (4, 'Aparat de Sudura', 800.00, 4, 4);

INSERT INTO SERVICII (ID_serviciu, nume_serviciu, data_prestarii, ID_furnizor)
VALUES (1, 'Montaj Rigips', TO_DATE('2024-11-15', 'YYYY-MM-DD'), 2);
INSERT INTO SERVICII (ID_serviciu, nume_serviciu, data_prestarii, ID_furnizor)
VALUES (2, 'Sisteme Iluminat', TO_DATE('2024-12-01', 'YYYY-MM-DD'), 3);
INSERT INTO SERVICII (ID_serviciu, nume_serviciu, data_prestarii, ID_furnizor)
VALUES (3, 'Impermeabilizare Terase', TO_DATE('2024-10-20', 'YYYY-MM-DD'), 4);
INSERT INTO SERVICII (ID_serviciu, nume_serviciu, data_prestarii, ID_furnizor)
VALUES (4, 'Constructie Structura', TO_DATE('2024-09-05', 'YYYY-MM-DD'), 2);

INSERT INTO SECTOARE VALUES (1, 'TESA', 100000.00);
INSERT INTO SECTOARE VALUES (2, 'PRODUCTIE', 200000.00);
INSERT INTO SECTOARE VALUES (3, 'MENTENANTA', 150000.00);
INSERT INTO SECTOARE VALUES (4, 'DEPOZITARE', 80000.00);

INSERT INTO BUGETE VALUES (1, 2025, 80000.00, 1);
INSERT INTO BUGETE VALUES (2, 2025, 90000.00, 2);
INSERT INTO BUGETE VALUES (3, 2025, 120000.00, 3);
INSERT INTO BUGETE VALUES (4, 2025, 150000.00, 4);

INSERT INTO RAPOARTE_FINANCIARE VALUES (1, 1, 25000.00, 5000.00, 1);
INSERT INTO RAPOARTE_FINANCIARE VALUES (2, 2, 30000.00, 7000.00, 2);
INSERT INTO RAPOARTE_FINANCIARE VALUES (3, 3, 20000.00, 4000.00, 3);
INSERT INTO RAPOARTE_FINANCIARE VALUES (4, 4, 15000.00, 3000.00, 4);

INSERT INTO ALTE_CHELTUIELI VALUES (1, 'Transport', 5000.00, TO_DATE('2024-01-15', 'YYYY-MM-DD'));
INSERT INTO ALTE_CHELTUIELI VALUES (2, 'Promovare', 3000.00, TO_DATE('2024-02-10', 'YYYY-MM-DD'));
INSERT INTO ALTE_CHELTUIELI VALUES (3, 'Consumabile', 2000.00, TO_DATE('2024-03-05', 'YYYY-MM-DD'));
INSERT INTO ALTE_CHELTUIELI VALUES (4, 'intretinere', 1000.00, TO_DATE('2024-04-20', 'YYYY-MM-DD'));

INSERT INTO CHELTUIELI_LUNARE VALUES (1, 1, 2024, 1, 1, 1, 1, 1, 1);
INSERT INTO CHELTUIELI_LUNARE VALUES (2, 2, 2024, 2, 2, 2, 2, 2, 2);
INSERT INTO CHELTUIELI_LUNARE VALUES (3, 3, 2024, 3, 3, 3, 3, 3, 3);
INSERT INTO CHELTUIELI_LUNARE VALUES (4, 4, 2024, 4, 4, 4, 4, 4, 4);
INSERT INTO CHELTUIELI_LUNARE VALUES (5, 1, 2025, 1, 2, 3, 1, 2, 3);
INSERT INTO CHELTUIELI_LUNARE VALUES (6, 2, 2025, 2, 3, 4, 2, 3, 4);
INSERT INTO CHELTUIELI_LUNARE VALUES (7, 3, 2025, 3, 4, 1, 3, 4, 1);
INSERT INTO CHELTUIELI_LUNARE VALUES (8, 4, 2025, 4, 1, 2, 4, 1, 2);

-- 11. Cererea 1
SELECT 
    S.nume_sector AS Sector,
    CL.luna AS Luna,
    COALESCE(SUM(M.pret * M.cantitate), 0) + COALESCE(SUM(MA.pret * MA.cantitate), 0) + 
    COALESCE(SUM(SC.pret * SC.cantitate), 0) AS Total_Cheltuieli
FROM 
    SECTOARE S
LEFT JOIN 
    CHELTUIELI_LUNARE CL ON S.ID_sector = CL.ID_sector
LEFT JOIN 
    MATERIALE M ON CL.ID_material = M.ID_material
LEFT JOIN 
    MATERIALE_AUXILIARE MA ON CL.ID_material_auxiliar = MA.ID_material_auxiliar
LEFT JOIN 
    SCULE SC ON CL.ID_scula = SC.ID_scula
GROUP BY 
    S.nume_sector, CL.luna
ORDER BY 
    S.nume_sector, CL.luna;

-- 11. Cererea 2
SELECT 
    S.nume_sector AS Sector,
    AVG(RF.profit) AS Profit_Mediu
FROM 
    SECTOARE S
JOIN 
    RAPOARTE_FINANCIARE RF ON S.ID_sector = RF.ID_sector
WHERE 
    RF.luna IN (
        SELECT 
            DISTINCT CL.luna
        FROM 
            CHELTUIELI_LUNARE CL
        WHERE 
            CL.an = 2024
    )
GROUP BY 
    S.nume_sector
ORDER BY 
    Profit_Mediu DESC
FETCH FIRST 1 ROW ONLY;

-- 11. Cererea 3
SELECT 
    SC.nume AS Scula,
    COUNT(DISTINCT CL.ID_sector) AS Numar_Sectoare,
    LISTAGG(S.nume_sector, ', ') WITHIN GROUP (ORDER BY S.nume_sector) AS Sectoare
FROM 
    SCULE SC
JOIN 
    CHELTUIELI_LUNARE CL ON SC.ID_scula = CL.ID_scula
JOIN 
    SECTOARE S ON CL.ID_sector = S.ID_sector
GROUP BY 
    SC.nume
HAVING 
    COUNT(DISTINCT CL.ID_sector) > 1
ORDER BY 
    Numar_Sectoare DESC;


-- 12
CREATE OR REPLACE PROCEDURE calcul_cheltuieli_sector IS
    CURSOR c_cheltuieli IS
        SELECT 
            S.nume_sector, 
            COALESCE(SUM(M.pret * M.cantitate), 0) +
            COALESCE(SUM(MA.pret * MA.cantitate), 0) +
            COALESCE(SUM(SC.pret * SC.cantitate), 0) AS Total_Cheltuieli
        FROM 
            SECTOARE S
        LEFT JOIN 
            CHELTUIELI_LUNARE CL ON S.ID_sector = CL.ID_sector
        LEFT JOIN 
            MATERIALE M ON CL.ID_material = M.ID_material
        LEFT JOIN 
            MATERIALE_AUXILIARE MA ON CL.ID_material_auxiliar = MA.ID_material_auxiliar
        LEFT JOIN 
            SCULE SC ON CL.ID_scula = SC.ID_scula
        GROUP BY 
            S.nume_sector;

    v_nume_sector SECTOARE.nume_sector%TYPE;
    v_total_cheltuieli NUMBER;
    
BEGIN
    OPEN c_cheltuieli;
    
    LOOP
        FETCH c_cheltuieli INTO v_nume_sector, v_total_cheltuieli;
        
        EXIT WHEN c_cheltuieli%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Sector: ' || v_nume_sector || ', Total Cheltuieli: ' || v_total_cheltuieli || ' EUR');
    END LOOP;
    
    CLOSE c_cheltuieli;
END calcul_cheltuieli_sector;
/

BEGIN
    calcul_cheltuieli_sector;
END;
/

-- 13
CREATE OR REPLACE FUNCTION TotalCheltuieliSector (
    p_luna IN NUMBER,
    p_sector IN NUMBER
) RETURN NUMBER IS
    v_total NUMBER;
BEGIN
    IF p_luna < 1 OR p_luna > 12 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Luna specificata (' || p_luna || ') este invalida. Introduceti o luna intre 1 si 12.');
    END IF;

    SELECT 
        COALESCE(SUM(M.pret * CL.ID_material), 0) +
        COALESCE(SUM(MA.pret * CL.ID_material_auxiliar), 0) +
        COALESCE(SUM(SC.pret * CL.ID_scula), 0) +
        COALESCE(SUM(AC.valoare), 0)
    INTO v_total
    FROM 
        CHELTUIELI_LUNARE CL
    LEFT JOIN MATERIALE M ON CL.ID_material = M.ID_material
    LEFT JOIN MATERIALE_AUXILIARE MA ON CL.ID_material_auxiliar = MA.ID_material_auxiliar
    LEFT JOIN SCULE SC ON CL.ID_scula = SC.ID_scula
    LEFT JOIN ALTE_CHELTUIELI AC ON CL.ID_alte_cheltuieli = AC.ID_alte_cheltuieli
    WHERE 
        CL.luna = p_luna AND CL.ID_sector = p_sector;

    RETURN v_total;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Nu exista date pentru luna ' || p_luna || ' si sectorul ' || p_sector);
        RETURN 0;

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('A aparut o eroare neasteptata: ' || SQLERRM);
        RETURN 0;
END TotalCheltuieliSector;
/

SET SERVEROUTPUT ON;

-- 13.1 Date existente
DECLARE
    rezultat NUMBER;
BEGIN
    rezultat := TotalCheltuieliSector(1, 1);
    DBMS_OUTPUT.PUT_LINE('Totalul cheltuielilor pentru luna 1, sectorul 1: ' || rezultat || ' EUR');
END;
/

-- 13.2 Fara date
DECLARE
    rezultat NUMBER;
BEGIN
    rezultat := TotalCheltuieliSector(5, 3);
    DBMS_OUTPUT.PUT_LINE('Totalul cheltuielilor pentru luna 5, sectorul 3: ' || rezultat || ' EUR');
END;
/

-- 13.3 Luna invalida
DECLARE
    rezultat NUMBER;
BEGIN
    rezultat := TotalCheltuieliSector(13, 1);
    DBMS_OUTPUT.PUT_LINE('Totalul cheltuielilor pentru luna 13, sectorul 1: ' || rezultat || ' EUR');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Eroare: ' || SQLERRM);
END;
/

-- 14
CREATE OR REPLACE PROCEDURE CalculTotalCheltuieli (
    p_luna IN NUMBER,
    p_sector IN NUMBER
) IS
    v_total NUMBER;
BEGIN
    IF p_luna < 1 OR p_luna > 12 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Luna specificata (' || p_luna || ') este invalida. Introduceti o luna intre 1 si 12.');
    END IF;

    SELECT 
        COALESCE(SUM(M.pret * CL.ID_material), 0) +
        COALESCE(SUM(MA.pret * CL.ID_material_auxiliar), 0) +
        COALESCE(SUM(SC.pret * CL.ID_scula), 0) +
        COALESCE(SUM(AC.valoare), 0)
    INTO v_total
    FROM 
        CHELTUIELI_LUNARE CL
    LEFT JOIN MATERIALE M ON CL.ID_material = M.ID_material
    LEFT JOIN MATERIALE_AUXILIARE MA ON CL.ID_material_auxiliar = MA.ID_material_auxiliar
    LEFT JOIN SCULE SC ON CL.ID_scula = SC.ID_scula
    LEFT JOIN ALTE_CHELTUIELI AC ON CL.ID_alte_cheltuieli = AC.ID_alte_cheltuieli
    WHERE 
        CL.luna = p_luna AND CL.ID_sector = p_sector;

    DBMS_OUTPUT.PUT_LINE('Totalul cheltuielilor pentru luna ' || p_luna || ', sectorul ' || p_sector || ': ' || v_total || ' EUR');

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Nu exista date pentru luna ' || p_luna || ' si sectorul ' || p_sector);
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Eroare: prea multe randuri returnate pentru luna ' || p_luna || ' si sectorul ' || p_sector);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('A aparut o eroare neasteptata: ' || SQLERRM);
END CalculTotalCheltuieli;
/

-- 14.1 Date existente
BEGIN
    CalculTotalCheltuieli(1, 1);
END;
/

-- 14.2 Fara date
BEGIN
    CalculTotalCheltuieli(5, 3);
END;
/

-- 14.3 Luna invalida
BEGIN
    CalculTotalCheltuieli(13, 1);
END;
/

-- 15
CREATE OR REPLACE TRIGGER trg_cheltuieli_lunare_lmd
AFTER INSERT OR UPDATE OR DELETE ON CHELTUIELI_LUNARE
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        DBMS_OUTPUT.PUT_LINE('A fost inserat un rand nou in CHELTUIELI_LUNARE: ID_cheltuiala = ' || :NEW.ID_cheltuiala);
    ELSIF UPDATING THEN
        DBMS_OUTPUT.PUT_LINE('A fost actualizat un rand in CHELTUIELI_LUNARE: ID_cheltuiala = ' || :OLD.ID_cheltuiala || ' -> ' || :NEW.ID_cheltuiala);
    ELSIF DELETING THEN
        DBMS_OUTPUT.PUT_LINE('A fost sters un rand din CHELTUIELI_LUNARE: ID_cheltuiala = ' || :OLD.ID_cheltuiala);
    END IF;
END trg_cheltuieli_lunare_lmd;
/
--15.1
INSERT INTO CHELTUIELI_LUNARE (ID_cheltuiala, luna, an, ID_material, ID_material_auxiliar, ID_scula, ID_serviciu, ID_sector, ID_alte_cheltuieli)
VALUES (9, 1, 2025, 1, 2, 3, 1, 2, 3);
--15.2
UPDATE CHELTUIELI_LUNARE
SET luna = 2
WHERE ID_cheltuiala = 9;
--15.3
DELETE FROM CHELTUIELI_LUNARE
WHERE ID_cheltuiala = 9;


--16
ALTER TABLE RAPOARTE_FINANCIARE
ADD data_modificarii DATE;

CREATE OR REPLACE TRIGGER trg_rapoarte_financiare
BEFORE INSERT ON RAPOARTE_FINANCIARE
FOR EACH ROW
BEGIN
    :NEW.data_modificarii := SYSDATE;
END;
/
--16.1
INSERT INTO RAPOARTE_FINANCIARE (ID_raport, luna, total_cheltuieli, profit, ID_sector)
VALUES (5, 5, 35000.00, 8000.00, 2);
--16.2
UPDATE RAPOARTE_FINANCIARE
SET total_cheltuieli = 40000.00
WHERE ID_raport = 5;
--16.3
SELECT * FROM RAPOARTE_FINANCIARE WHERE ID_raport = 5;