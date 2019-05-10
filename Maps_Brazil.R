
# --------------------------------------------------------------------- # 
# MAPA Macroregião
library(brazilmaps)
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


# Documentação : https://cran.r-project.org/web/packages/brazilmaps/brazilmaps.pdf
# --------------------------------------------------------------------- # 
# 2 - MAPA Macroregião

library(tidyverse);library(ggplot2)

map_emprego2<- get_brmap("Region") %>% 
  inner_join(Empregos_Formais, c("Region" = "Regiao"))

glimpse(map_2)

mapa2<-map_emprego2%>% 
  ggplot() +
  geom_sf(aes(fill = Empregos))+
  # muda escala de cores
  theme(axis.text.x = element_text(angle = 90, hjust = 1))+
  labs(title = "Número de empregos formais nas OSCs por região, Brasil - 2015")+
  theme(aspect.ratio=1)# guides(fill=FALSE)

mapa2+guides(fill = guide_legend(label.position = "left", label.hjust = 1))
