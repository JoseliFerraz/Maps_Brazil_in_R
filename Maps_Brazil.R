
# --------------------------------------------------------------------- # 
# MAPA Macroregião
library(brazilmaps)
# https://mapaosc.ipea.gov.br/dados-indicadores.html
# --------------------------------------------------------------------- # 

numero_emp<- c(166206,305430,70645,1351812,410070)
macro_regiao<- c("Centro-Oeste","Nordeste","Norte","Sudeste","Sul")
regiao<- c(5,2,1,3,4)
Empregos_Formais <- data.frame(numero_emp,macro_regiao,regiao)

names(Empregos_Formais)<- c("Empregos","Macroregiao","Regiao")


mapa_emprego<- get_brmap(geo = "Region")

mapa_emprego<- plot_brmap(mapa_emprego,
                 data_to_join = Empregos_Formais,
                 join_by = c("Region" = "Regiao"),
                 var = "Empregos")


mapa_emprego+
  labs(title = "Número de empregos formais nas OSCs por região, Brasil - 2015")


# Latitude e Longitude das Regiões do Brasil
Latitude<- c(-60.11427458,-55.11427458,-40.11427458,-52.11427458,-45.11427458)
Lontgitude<- c(-2.19830591,-14.09999000,-5.99999000,-26.99999000,-20.99999000)

mapa_emprego+
  # Adicionando titulo ao grafico
  labs(title = "Número de empregos formais nas OSCs por região, Brasil - 2015")+
  scale_fill_continuous(low = "gray", high = "dark green", 
                        name = "Quantidade de Empregos (2015)", label = scales::comma, 
                        breaks=c(70645,670000,1351812))+
  geom_text(aes(Latitude,Lontgitude,label = Empregos_Formais$Macroregiao),
            data = Empregos_Formais,  size = 3)
