# Instalando e Carregando nossas Bibliotecas

# install.packages("caTools")
# install.packages("e1071")
# install.packages("caret")

library("caTools")
library("e1071")
library(caret)


# Carregando nossa base de dados 
base <-  read.csv('credit_data.csv')

#  Apagando minha coluna ClientID, na hora de ultilizarmos nossos algoritimos
base$clientid = NULL

# Colocando minha variavel em Default para factor, para nosso algoritmo SVM
base$default <- as.factor(base$default)

# Vizualizando minha base
str(base)

# Atualizando meus valores com a media das idades, pois 

base$age <-  ifelse(base$age < 0, 40.92, base$age)

# Atualizandoi meus valores Faltantes
# na.rm = TRUE-- > NAO TRAZ OS VALORES FALTANTES

base$age <- ifelse(is.na(base$age), mean(base$age, na.rm = TRUE), base$age)


# Iremos Padronizar nossos dados para ficarem em uma mesma escala, para nosso
# algoritmo

base[, 1:3] <-  scale(base[, 1:3])

# Chamando o comando set.seed, nossa semenete aletoria
set.seed(1)

# Divindo nossos dados em Treinamento e teste

# 1500 --> para treinar
# 500 --> teste 

divisao <-  sample.split(base$default, SplitRatio = 0.75)
divisao

# Criando minha base de treinamento


base_treinamento <- subset(base, divisao == TRUE)

# Criando minha base de dados de teste

base_teste <-  subset(base, divisao == FALSE)



############### COMEÇANDO O ALGORITIMO #####################################


# Criando o nosso classificador

# formula = default --> ira receber nosso atributo classe

# data = base_treinamento --> onde ira receber nosso atributo de treinamento

# type --> onde podemos escolher como classificação ou regressão, 
# "sendo classificação C-classification"

# kernel --> onde podemos escolher qual iremos usar "linear,polinomial,radial ou sigmoid"

# Nossos Kernel Testado pelo algoritmo

# kernel = 'linear' --> 94.8 %
# kernel = 'polynomial' --> 96.6%
# kernel = 'radial' --> 98.8 %
# kernel = 'sigmoid' --> 84.6

# cost --> variavel custo como default ele vem como "1", quando mais alto ele ira
# tentar encontrar a melhor reta e com valores menores a tendencia e piorar

# cost = 0.2 --> 97.2%   --> com o kernel radial 
# cost = 5.0 --> 98.8%   --> com o kernel radial 

classificador <-  svm(formula = default ~.,data = base_treinamento, 
                    type = 'C-classification', kernel = 'radial', cost = 5.0)

print(classificador)

# rodando meu algotimo
# Number of Support Vectors:  203 --> numero de suporte que achou


# Criando minha variavel de Previsão
previsoes <-  predict(classificador, newdata = base_teste[-4])


# Criando Minha Matriz de confusão
matriz_confusao <-  table(base_teste[, 4], previsoes)
matriz_confusao

# Verificando minha acuracia
confusionMatrix(matriz_confusao)

# Criando nossa Validação cruzada para os teste

# classProbs = T --> as probabilidades de classe devem ser calculadas 
# para modelos de classificação 

# summaryFunction = twoClassSummary --> uma função para calcular métricas de 
# desempenho em reamostras

controle <- trainControl(method = "cv", number = 10)

# criando nossso grid search para ajustar os hiperparemetros

grid <- expand.grid(.sigma = c(0.1, 0.5, 1), .C = c(1, 5, 10))




# Fazendo nosso treinamento do modelo

modelo_cross <- train(default ~., data = base_treinamento,
                      method = "svmRadial", trControl = controle, tuneGrid = grid)


# Gernado um grafico no ggplot
ggplot(modelo_cross)
print(modelo_cross)

# Criando previsoes de nosso modelo
previsoes_modelo_cross <- predict(modelo_cross, newdata = base_teste[-4])

# Criando nossa matriz e confusão
matriz_confusao_modelo_cross <- table(base_teste[,4], previsoes_modelo_cross)
matriz_confusao_modelo_cross

# Vizualizando nossa confusion matrix pela biblioteca
confusionMatrix(matriz_confusao_modelo_cross)

# Verificando minhas variaveis mais imporantes
varImp(modelo_cross)
