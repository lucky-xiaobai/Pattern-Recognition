with open('iris.txt', 'r') as f:
    text = f.readlines()
    print(len(text))  # 训练集和测试集8 2分,一共150个数据
    train_list = []
    test_list = []
    index = 0
    for i in range(len(text)):
        if index < 8:
            train_list.append(text[i])
        else:
            test_list.append(text[i])
        index += 1
        if index == 10:
            index = 0
    print('the length of train_list:{}'.format(len(train_list)))
    print('the length of test_list:{}'.format(len(test_list)))

with open('train.txt','w') as f:
    f.writelines(train_list)

with open('test.txt','w') as f:
    f.writelines(test_list)


