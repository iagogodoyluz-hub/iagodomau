CREATE DATABASE	 JSON_DATABASE;
USE JASON_DATABASE;

CREATE TABLE dados_json(
json char (250)
);

INSERT INTO dados_json VALUES(
'{
"nome" : "josé", 
"sobrenome" : "cardoso",
"idade" : "25",
"ID": "001"
)');
SELECT * FROM dados_json;

CREATE TABLE json_dados(
teste_json json 
);
INSERT INTO json_dados VALUES( 
'(
"nome" : "maria"
"sobrenome" : "silva",
"idade" : "23",
"ID" : "002"
)');


select * from json_dados;

select * from countryinfo;

select doc from countryinfo where _id = 'BRA';

select Json_keys (doc) from countryinfo where _id = 'BRA'; 

#Para acessar um json dentro de um json

select json_keys(doc, "$.geography") from countryinfo 

where _id = 'BRA';

select json_extract(doc,"$.IndepYear") from countryinfo 
where _id = 'BRA';

select json_extract(doc,"$.government.HeadOfState") from countryinfo 
where _id = 'USA';

select json_extract(doc,"$.demographics.Population") from countryinfo 
where _id = 'USA';

#exiba uma tabela com a populçao total e a media 
#da expectativa de cida de  cada continente para os paises 
#que sao monarquias . Agrupe e ordene os dados exibidos.

select json_extract(doc, "$.geography.Continent") as Continente 
SUM(json_extract(doc, "$.demographics.Population"))  as Populacao 