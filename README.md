# Previsao_de_Inadimplencia_de_Emprestimos_SVM-Support-Vector-Machine-

Previsão de Inadimplência de Empréstimos SVM

### Introdução:

Este projeto tem como objetivo desenvolver um modelo de classificação utilizando a técnica de Support Vector Machine (SVM) para prever a probabilidade de inadimplência de clientes de crédito. O modelo foi treinado e avaliado utilizando dados fictícios para fins didáticos.

### Metodologia

#### Pré-processamento dos Dados

**Limpeza:** 

Foram removidos valores inconsistentes, como idades negativas.

**Padronização:** 

Os dados numéricos foram padronizados para garantir que todas as features tivessem a mesma escala.

**Tratamento de valores faltantes:** 

Valores faltantes na idade foram imputados com a média da idade.


#### Modelagem

**Algoritmo:** 

O SVM foi escolhido devido à sua capacidade de lidar com problemas de classificação não linear e à sua robustez a outliers

**Ajuste de hiperparâmetros:** 

O parâmetro `cost` foi ajustado para encontrar o melhor compromisso entre o ajuste dos dados de treinamento e a generalização do modelo.


**Validação cruzada:** 

A validação cruzada de 10 folds foi utilizada para avaliar o desempenho do modelo de forma mais robusta.

#### Avaliação

O modelo foi avaliado utilizando a matriz de confusão, que permite calcular métricas como acurácia, precisão, recall e F1-score.

![image](https://github.com/user-attachments/assets/81dd3c8f-6ddb-40cb-aef4-041415fb765e)


### Resultados

O modelo apresentou uma acurácia de 99% na previsão de inadimplência na base de testes. **[Observação: A acurácia pode não ser a métrica mais adequada em casos de desbalanceamento de classes. Considere utilizar outras métricas como precisão, recall e F1-score]**

### Limitações

**Dados fictícios:**

Os resultados podem não ser generalizáveis para dados reais.

**Desbalanceamento de classes:** 

Se a base de dados tiver um desbalanceamento significativo entre as classes (adimplentes e inadimplentes), técnicas como oversampling ou undersampling podem ser necessárias.

**Simplicidade do modelo:** 

Este é um modelo básico. Para aplicações reais, pode ser necessário explorar modelos mais complexos e combinar diferentes técnicas.

### Requisitos

**R:** Versão 4.0 ou superior.

**Bibliotecas:** caTools, e1071, caret

### Autor
Matheus Andrade Moreira


