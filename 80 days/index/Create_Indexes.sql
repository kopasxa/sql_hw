USE Vokrug_Sveta
GO

CREATE INDEX poten_tur ON Potential_tourist(T_id,Cl_id);

CREATE INDEX archiv ON Arhive(Tour_id, Start);

CREATE INDEX marshrut ON Tochka_Marshrut(Tour_nomer, Gorod_marsh);
GO