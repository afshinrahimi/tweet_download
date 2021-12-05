import re

def clean(input_file ='tweets.tsv'):
    texts = []
    with open(input_file, 'r') as fin:
        for line in fin:
            fields = line.split('\t')
            text = fields[-1]
            text = re.sub(r"(?:\@|http?\://|https?\://|www)\S+", "", text)
            texts.append(text)
    return texts


texts = clean()
with open('texts.txt', 'wt') as fout:
    for line in texts:
        fout.write(line.strip())
        fout.write('\n')



