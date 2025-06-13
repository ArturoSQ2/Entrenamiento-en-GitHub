#Arturo_Sedano_Quirarte
install.packages("NHANES")
library(NHANES)
library(dslabs)
library(dplyr)
data(NHANES)

#Arturo_Sedano_Quirarte
#Ejercico 1
data(na_example)
mean(na_example)
sd(na_example)

mean(na_example, na.rm = TRUE)
sd(na_example, na.rm = TRUE)
#mean 2.301754, sd 1.22338


#Arturo_Sedano_Quirarte
#Ejercico 2
#library(dplyr)
tab <- NHANES %>% filter( AgeDecade == " 20-29" & Gender == "female")

#Arturo_Sedano_Quirarte
#Ejercico 3
ref <- summarize(tab,
  average = mean(BPSysAve,na.rm = TRUE),
  standar_deviation = sd(BPSysAve,na.rm = TRUE)
)
ref
#ave 108.   sd 10.1


#Arturo_Sedano_Quirarte
#Ejercico 4
ref_avg <- summarize(tab,
                 average = mean(BPSysAve,na.rm = TRUE),
                 standar_deviation = sd(BPSysAve,na.rm = TRUE)
)%>% pull(average) # tambien se podia usar %>% .$average



#Arturo_Sedano_Quirarte
#Ejercico 5
ref_minmax <- summarize(tab,
                     minbp = min(BPSysAve,na.rm = TRUE),
                     maxbp = max(BPSysAve,na.rm = TRUE)
)
#84 179


#Arturo_Sedano_Quirarte
#Ejercico 6
tab <- NHANES %>% filter(Gender == "male") %>% group_by(AgeDecade)
result <- summarize(tab,
                     average = mean(BPSysAve,na.rm = TRUE),
                     standar_deviation = sd(BPSysAve,na.rm = TRUE)
)%>% pull(average) # tambien se podia usar %>% .$average
print(result)

#Arturo_Sedano_Quirarte
#Ejercico 7
tab <- NHANES %>% filter(Gender == "female") %>% group_by(AgeDecade)
result2 <- summarize(tab,
                    average = mean(BPSysAve,na.rm = TRUE),
                    standar_deviation = sd(BPSysAve,na.rm = TRUE)
)%>% pull(average) # tambien se podia usar %>% .$average
print(result2)

#Arturo_Sedano_Quirarte
#Ejercico 8
tab <- NHANES %>% group_by(AgeDecade, Gender)
resultados_combinados <- summarize(tab,
                    average = mean(BPSysAve,na.rm = TRUE),
                    standar_deviation = sd(BPSysAve,na.rm = TRUE)
)%>% pull(average) # tambien se podia usar %>% .$average
print(resultados_combinados)

#Arturo_Sedano_Quirarte
#Ejercico 9
tab <- NHANES %>% filter(Gender == "male" & AgeDecade == " 40-49") %>% group_by(Race1)
resultados_combinados <- summarize(tab,
                                   average = mean(BPSysAve,na.rm = TRUE),
                                   standar_deviation = sd(BPSysAve,na.rm = TRUE)
)%>% pull(average) # tambien se podia usar %>% .$average
print(resultados_combinados)



