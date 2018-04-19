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
    sword=strip(word, ['.','!','?'])
    if(haskey(wordcounts, sword))
        wordcounts[sword]=wordcounts[sword]+1
    else
        wordcounts[sword]=1
    end
end

#sort the counts by the values (high to low)
orderedcounts=sort(collect(wordcounts), by = tuple -> last(tuple), rev=true)

#print results
println(numWords, " words")
println(numSentences, " sentences")
for i in 1:10
    println(orderedcounts[i][1], " ", orderedcounts[i][2])
end
close(f)
