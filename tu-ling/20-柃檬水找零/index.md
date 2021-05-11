#### 柠檬水找零

> 在柠檬水摊上，每一杯柠檬水的售价为5美元。顾客排毒购买你的产品，一次购买一杯。
>
> 每位顾客只买一杯柠檬水，然后向你支付5美元、10美元或20美元。必须给每个顾客正确找零。
>
> 注意：一开始你手头没有任何零钱。
>
> 如果你能给每位顾客正确找零，返回true，否则返回false。



##### 解题思路

记录5美元和10美元的个数，（20美元不用记录，无法用于找零）

遇到10美元时只能用5美元来找零；

遇到20美元时可以5美元 + 10 美元来找零，也可以用 3 个5美元来找零，此时需要优先使用10美元来找零



##### 代码

```python
def change(bills):
    five = 0
    ten = 0
    for bill in bills:
        if bill == 5:
            five += 1
        elif bill == 10:
            if five < 0:
                return False
            five -= 1
            ten += 1
        else:
            if five > 0 and ten > 0:
                ten -= 1
                five -= 1
            elif five >= 3:
                five -= 3
            else:
                return False
    return True
```

