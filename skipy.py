from scipy.stats import shapiro

data = [336, 688, 2, 55, 121, 579, 91, 60]

stat, p = shapiro(data)

print(f"Статистика: {stat}, p-значение: {p}")

alpha = 0.05
if p > alpha:
    print("We do not reject H0")
else:
    print("Reject H0")


