#CHANGE PATH HERE
path ="man_from_mars.txt"
#open file and read contents into array of words
f=open(path)
stuff = readstring(f)
words = split(stuff)

#counters for words, sentences
numWords=0
numSentences=0
wordcounts=Dict() #keep track of counts of each words

#loop through each word in the book
for word in words
    numWords=numWords+1
    #if word ends in .!? its the end of a sentence
    if(word[endof(word)]=='!' || word[endof(word)]=='.' || word[endof(word)]=='?')
        numSentences=numSentences+1
    end
    #strip punctuation off of word and add it to dictionary
    sword=lowercase(strip(word, ['.','!','?']))
    if(haskey(wordcounts, sword))
        wordcounts[sword]=wordcounts[sword]+1
    else
        wordcounts[sword]=1
    end
end

#sort the counts by the values (high to low)
orderedcounts=sort(collect(wordcounts), by = tuple -> last(tuple), rev=true)
stopwords = ("ourselves", "hers", "between", "yourself", "but", "again", "there", "about", "once", "during", "out", "very", "having", "with", "they", "own", "an", "be", "some", "for", "do", "its", "yours", "such", "into", "of", "most", "itself", "other", "off", "is", "s", "am", "or", "who", "as", "from", "him", "each", "the", "themselves", "until", "below", "are", "we", "these", "your", "his", "through", "don", "nor", "me", "were", "her", "more", "himself", "this", "down", "should", "our", "their", "while", "above", "both", "up", "to", "ours", "had", "she", "all", "no", "when", "at", "any", "before", "them", "same", "and", "been", "have", "in", "will", "on", "does", "yourselves", "then", "that", "because", "what", "over", "why", "so", "can", "did", "not", "now", "under", "he", "you", "herself", "has", "just", "where", "too", "only", "myself", "which", "those", "i", "after", "few", "whom", "t", "being", "if", "theirs", "my", "against", "a", "by", "doing", "it", "how", "further", "was", "here", "than")
topten = []
i = 1
while length(topten) < 10
    if !(orderedcounts[i][1] in stopwords)
        push!(topten, orderedcounts[i][1])
        i+=1
    else
        i+=1
    end
end
#print results
println(numWords, " words")
println(numSentences, " sentences")
for i in 1:10
    println(topten[i])
end

close(f)
