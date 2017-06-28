# Trie implementation using nested hashes
  class Trie

    def initialize
      @rootNode = {}
    end

    def checkPresentAndAdd(word)

      currentNode = @rootNode
      isNewWord = false

      # Work downwards through the trie and add nodes
      # as needed.
      word.split(//).each do |char|
        if !currentNode.key? char
          isNewWord = true
          currentNode[char] = {}
        end
        currentNode = currentNode[char]
      end

      # Explicitly mark the end of a word to
      # distinguish between prefix and URL's
      if !currentNode.key? "End Of Word"
        isNewWord = true
        currentNode["End Of Word"] = {}
      end

      return isNewWord
    end
end
