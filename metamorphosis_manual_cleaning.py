#load text
filename = 'metamorphosis_clean.txt'
file = open(filename, 'rt')
text = file.read()
file.close()
#split into words by whitespace
words = text.split()
#convert to lower space
words = [word.lower() for word in words]
#remove punctuation
import string
table = str.maketrans('', '', string.punctuation)
stripped = [w.translate(table) for w in words]
print(stripped[:100])
