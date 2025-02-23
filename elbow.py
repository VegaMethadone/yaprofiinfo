"""
import numpy as np
import matplotlib.pyplot as plt
from sklearn.cluster import KMeans

# Данные без столбца "Итого" (замени на свои)
data = np.array([
    [39, 48, 55, 60, 53, 50, 45, 53, 45, 46, 49, 59],  # Внешнее мошенничество
    [21, 19, 21, 38, 27, 28, 33, 21, 25, 21, 31, 29],  # Внутреннее мошенничество
    [2, 6, 3, 2, 1, 6, 3, 7, 2, 3, 3, 3],  # Трудовое законодательство
    [8, 7, 8, 9, 4, 5, 12, 12, 7, 9, 8, 11]  # Ущерб материальным активам
])

# Транспонируем данные (чтобы строки стали наблюдениями)
data = data.T  

# Количество кластеров для теста
K = range(1, 10)

# Считаем SSE (сумму квадратов ошибок)
sse = []
for k in K:
    kmeans = KMeans(n_clusters=k, random_state=42, n_init=10)
    kmeans.fit(data)
    sse.append(kmeans.inertia_)  # inertia_ — это SSE

# Строим график метода локтя
plt.figure(figsize=(8, 5))
plt.plot(K, sse, marker='o', linestyle='-')
plt.xlabel("Число кластеров K")
plt.ylabel("Сумма квадратов ошибок (SSE)")
plt.title("Метод локтя для K-means")
plt.show()
"""
import numpy as np
import matplotlib.pyplot as plt
from sklearn.cluster import KMeans

# Данные
data = np.array([
    [39, 48, 55, 60, 53, 50, 45, 53, 45, 46, 49, 59],
    [21, 19, 21, 38, 27, 28, 33, 21, 25, 21, 31, 29],
    [2, 6, 3, 2, 1, 6, 3, 7, 2, 3, 3, 3],
    [8, 7, 8, 9, 4, 5, 12, 12, 7, 9, 8, 11]
]).T  # Транспонируем

# Количество кластеров
K = range(1, 10)

# Считаем SSE
sse = []
for k in K:
    kmeans = KMeans(n_clusters=k, random_state=42, n_init=10)
    kmeans.fit(data)
    sse.append(kmeans.inertia_)

# График
plt.figure(figsize=(8, 5))
plt.plot(K, sse, marker='o', linestyle='-')

# Добавляем больше делений по X
plt.xticks(np.arange(1, 10, 1))  # Деления по X с шагом 1

# Добавляем деления по Y с шагом 100
plt.yticks(np.arange(0, max(sse) + 100, 100))  # Деления от 0 до максимального SSE с шагом 100

plt.xlabel("Число кластеров K")
plt.ylabel("Сумма квадратов ошибок (SSE)")
plt.title("Метод локтя для K-means")
plt.grid(True)  # Включаем сетку
plt.show()
