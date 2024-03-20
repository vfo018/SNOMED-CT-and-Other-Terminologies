import openpyxl


#对输入数据进行处理去除特殊符号
#去除特殊词组
def process_data(term1,term2):
    # 先去掉特殊符号,不留空
    special_charater1 = ['"', "+", "+/-", "&", "(", ")",","]
    for sc in special_charater1:
        term2 = term2.replace(sc, "")
        term1 = term1.replace(sc, "")
    # 去掉但是要留空的
    special_charater2 = [" - ", " / ","/", "  ", ]
    for sc2 in special_charater2:
        term2 = term2.replace(sc2, " ")
        term1 = term1.replace(sc2, " ")
    word1 = term1.replace('"', '').split(' ')  # 去除"且用空格分离
    word2 = term2.replace('"', '').split(' ')

    # 特殊字符加入一个set
    # special_word = ['and', 'or', 'with', 'of', 'surgery', 'operation', 'special acharacters',
    #                 'space', 'test', 'treatment', 'examination', 'from', 'to', 'using', 'left',
    #                 'right', 'bilateral', 'yes/no', 'in']
    special_word = ['and', 'or', 'with', 'of', 'surgery', 'operation', 'special acharacters',
                    'space', 'test', 'treatment', 'examination', 'from', 'to', 'using', 'yes/no', 'in', 's', 'disease',
                    'disorder']
    special_word_set = set()
    for i in special_word:
        special_word_set.add(i)

    # 去除特殊字符
    for iii in word1:
        if (iii in special_word_set):
            word1.remove(iii)
        if (len(iii)==0):
            word1.remove(iii)
    for ii in word2:
        if (ii in special_word_set):
            word2.remove(ii)
        if (len(ii)==0):
            word2.remove(ii)

    #word1=list(set(word1))
    #word2=list(set(word2))
    return word1,word2


def compute_likehood(term1,term2):
    word1,word2=process_data(term1,term2)
    #计算相似度
    #比较的前提是word1和word2有交集
    #如果word1长度大于word2 则backward
    #如果word1长度小于word2 则forward
    likehood=0
    #print(word1)
    #print(word2)
    insection=check_insection(word1,word2)  #返回交集
    #print(insection)
    #交集为空
    #print(insection)
    if(len(insection)==0):
        likehood=0
    else:
        word1_len=len(word1)
        word2_len=len(word2)
        insection_len=len(insection)
        if(word1_len>=word2_len):
            likehood=insection_len/word1_len
        else:
            likehood=insection_len/word2_len

    return likehood

#查询两个词组是否有交集
def check_insection(word1,word2):
    res=[]
    temp_set=set()
    for i in word1:
        temp_set.add(i)

    for ii in word2:
        if(ii in temp_set):
            #print(ii)
            res.append(ii)

    return res
