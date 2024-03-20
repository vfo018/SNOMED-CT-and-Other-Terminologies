import re


name1 = "G992A"
name2 = "apple!"

ret = re.match(r".*[A|D]$", name1)
if ret:
    name1 = name1[:-1]
    print(name1)
else:
    print("命名不正确")
