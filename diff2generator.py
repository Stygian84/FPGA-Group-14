import math
dict1 = {"a":1 ,"b":2 ,"c":3 ,"d":4 ,"e":5,
"f":6 ,"g":7 ,"h":8 ,"i":9 ,"j":10,
"k":11 ,"l":12 ,"m":13 ,"n":14 ,"o":15,
"p":16 ,"q":17 ,"r":18 ,"s":19 ,"t":20,
"u":21 ,"v":22 ,"w":23 ,"x":24 ,"y":25,
"z":26}

def decimalToBinary(n):
    return bin(n).replace("0b","")

# TODO just add animals word into this list
question=["bison","camel","moose","rhino","otter","sheep","sloth","goose"]

# Dont touch code below
case_count=0
no_of_bits = int(math.ceil(math.log2(len(question))))
answer_ls=[]
for item in question:
    #for the state cases
    count=0

    case_count_in_binary=decimalToBinary(case_count)
    while len(case_count_in_binary)<no_of_bits:
        case_count_in_binary="0"+case_count_in_binary
    case_count_in_binary="      b"+case_count_in_binary+": //"+item
    answer_ls.append(case_count_in_binary)

    #for the qns
    for letter in item:
        decimalvalue=decimalToBinary(dict1[letter])
        
        while len(decimalvalue)<5:
            decimalvalue="0"+decimalvalue
        decimalvalue="      question"+str(count)+"=5b"+decimalvalue+";"
        
        answer_ls.append(decimalvalue)
        count+=1
    case_count+=1

with open(r"C:\Users\Nicholas\Desktop\difficulty2.txt", 'w') as f:
    #hardcoding the first few lines
    f.write("//the questions and cases no are generated by a python file\
    \n//no of bits in rng input corresponds to maximum no of qns\
    \n//( max no of qns = 2^(x bits of rng input) )\
    \n//e.g. 2 bits = 2^2 qns max , 3 bits = 2^3 qns max\
    \n\nmodule question ( //category = animals\
    \ninput rng[")
    f.write(str(no_of_bits))
    f.write("], //change accordingly\
    \noutput question0[5],\
    \noutput question1[5],\
    \noutput question2[5],\
    \noutput question3[5],\
    \noutput question4[5]\
    \n  ) {\
    \n  always {\
    \n\n    case(rng){\n")
    f.write("\n")
    f.write("      default:\n")
    for index in range(1,6):
        if answer_ls[index][-1]!=";" and index!=0:
            f.write("\n")
        f.write(answer_ls[index])
        f.write('\n')
    f.write("\n")
    for index in range(len(answer_ls)):
        if answer_ls[index][-1]!=";" and index!=0:
            f.write("\n")
        f.write(answer_ls[index])
        f.write('\n')
    f.write("\n\n  }\n}")
print(answer_ls)

