SELECT * FROM VZW_DB.`2021q2-scd`;



SELECT 
	`AWS(1)-A1(CMA)`,
    `AWS(1)-A2(CMA)`,
    `AWS(1)-A1(CMA)`+`AWS(1)-A2(CMA)`
FROM VZW_DB.`2021q2-scd_verizon`;

CREATE VIEW `2021q2-scd_att_SUM` AS
SELECT 
	"ATT" as Carrier,
	FIPS,
    COUNTY,
    STATE,
	`600MHz-A`+`600MHz-B`+`600MHz-C`+`600MHz-D`+`600MHz-E`+`600MHz-F`+`600MHz-G` as `600_MHz`,
    `Lower700-A(EA)`+`Lower700-B(CMA)`+`Lower700-C(CMA)`+`Lower700-D(EAG)`+`Lower700-E(EAG)`+`Upper700-C(REAG)` as `700_MHz`,
    `SMR`,
    `Cellular-A(CMA)`+`Cellular-B(CMA)` as CELL,
    `PCS-A3(MTA/BTA)`+`PCS-A4(MTA/BTA)`+`PCS-A5(MTA/BTA)`+`PCS-D(BTA)`+`PCS-B3(MTA/BTA)`+`PCS-B4(MTA/BTA)`+`PCS-B5(MTA/BTA)`+`PCS-E(BTA)`+`PCS-F(BTA)`+`PCS-C3(BTA)`+`PCS-C4(BTA)`+`PCS-C5(BTA)`+`PCS-G(EA)`+`PCS-H` as `PCS`,
    `AWS(1)-A1(CMA)`+`AWS(1)-A2(CMA)`+`AWS(1)-B1(EA)`+`AWS(1)-B2(EA)`+`AWS(1)-C(EA)`+`AWS(1)-D(REAG)`+`AWS(1)-E(REAG)`+`AWS(1)-F1(REAG)`+`AWS(1)-F2(REAG)`+`AWS(3)-G(CMA)`+`AWS(3)-H(EA)`+`AWS(3)-I(EA)`+`AWS(3)-J1(EA)`+`AWS(3)-J2(EA)`+`AWS(3)-A1(CMA)`+`AWS(3)-B1(EA)`+`AWS(4)-A1`+`AWS(4)-A2`+`AWS(4)-B1`+`AWS(4)-B2` as `AWS`,
    `WCS-A`+`WCS-B`+`WCS-C`+`WCS-D` as `WCS`,
    `BR-S1` as `BR-S1`,
    `EB-A1`+`EB-A2`+`EB-A3`+`EB-B1`+`EB-B2`+`EB-B3`+`EB-C1`+`EB-C2`+`EB-C3`+`EB-D1`+`EB-D2`+`EB-D3`+`EB-A4`+`EB-B4`+`EB-C4`+`EB-D4`+`EB-G4`+`EB-G1`+`EB-G2`+`EB-G3` as `EBS`,
    `BR-F4`+`BR-E4`+`BR-S2`+`BR-E1`+`BR-E2`+`BR-E3`+`BR-F1`+`BR-F2`+`BR-F3`+`BR-H1`+`BR-H2`+`BR-H3` as `BRS`,
    `CBRS` as CBRS,
    `CBAND_Interim-A1`+`CBAND_Interim-A2`+`CBAND_Interim-A3`+`CBAND_Interim-A4`+`CBAND_Interim-A5` as `C-Band Interim`,
    `CBAND-A1`+`CBAND-A2`+`CBAND-A3`+`CBAND-A4`+`CBAND-A5`+`CBAND-B1`+`CBAND-B2`+`CBAND-B3`+`CBAND-B4`+`CBAND-B5`+`CBAND-C1`+`CBAND-C2`+`CBAND-C3`+`CBAND-C4` as `C-Band Final`,
    `24GHz-A`+`24GHz-B`+`24GHz-C`+`24GHz-D`+`24GHz-E`+`24GHz-F`+`24GHz-G` as `24GHz`,
    `28GHz-L1`+`28GHz-L2` as `28GHz`,
    `37/39GHz-M1`+`37/39GHz-M2`+`37/39GHz-M3`+`37/39GHz-M4`+`37/39GHz-M5`+`37/39GHz-M6`+`37/39GHz-M7`+`37/39GHz-M8`+`37/39GHz-M9`+`37/39GHz-M10`+`37/39GHz-N1`+`37/39GHz-N2`+`37/39GHz-N3`+`37/39GHz-N4`+`37/39GHz-N5`+`37/39GHz-N6`+`37/39GHz-N7`+`37/39GHz-N8`+`37/39GHz-N9`+`37/39GHz-N10`+`37/39GHz-N11`+`37/39GHz-N12`+`37/39GHz-N13`+`37/39GHz-N14` as `37/39GHz`,
    `47GHz-P1`+`47GHz-P2`+`47GHz-P3`+`47GHz-P4`+`47GHz-P5`+`47GHz-P6`+`47GHz-P7`+`47GHz-P8`+`47GHz-P9`+`47GHz-P10` as `47GHz`
    
FROM VZW_DB.`2021q2-scd_att`;