Definitely, using a hash is a solution of this problem. As we notice that most of the URL's start with "www." For a better solution we can use visited a nested hash where the outer key is the subdomain and the inner key is the rest of the URL. For example, visited['www.'] ['google.com'] = true and visited['www.'] ['dosomething.org'] = true. So in this case, instead of storing the "www." for each of this URL's, we have just stored in memory once. If we have 1000 URL's and 500 of them start with "www.", then we are replacing 500 * 4 characters with just 4 characters in memory.

To make this idea even further, if we can separate out the shared prefixes recursively and make the prefix just one character, our solution can be even more efficient.

##Solution

We can use a trie data structure to solve the problem. A trie is a tree data structure used for storing collection of strings. If two strings have a common prefix then they will have a same ancestor in the tree. Trie is a ideal data structure for storing our dictionary. Trie can also be used to do prefix based search and we can sort the strings lexographically in the trie.

Let's make visited a nested hash where each map has keys of just one character. So we will store 'google.com' as visited['g'] ['o'] ['o'] ['g'] ['l'] ['e'] ['.'] ['c'] ['o'] ['m'] [*] = true.
The '*' at the end means 'this is the end of an entry. This is just for distinguising a prefix and real URL in the visited hash. In the above example 'google.com' is a prefix. so if we add 'google.com/maps' to visited, we only have to add the characters '/maps', because 'google.com' is already saved as prefix. Same rule can be applied to 'google.com/about/jobs'

##Complexity

When we consider complexity we always think about how much space does this save? For the flat hash approach, we can calculate how many characters we were storing. If we think our visited includes all possible URL's of length 5 or fewer characters and we will ignore the non-alphabetical characters for simplicity. There are 26^5 different possible 5-character URLs. If we store each 5-character URL as a normal string in memory, we are storing 5 characters per string for a total of 5 * 26^5 characters for all possible 5-character strings. So for all 1,2,3,4, or 5 character URLs, our total number of characters stored is:

5 * 26^5 + 4 * 26^4 + 3 * 26^ 3 + 2 * 26^2 + 1 * 26^1

So for all possible URLs of length n or fewer, our total storage space is:
n26^n + (n - 1)26^(n-1) + ... + 1*26^1

This is O(n26^n)

Comparatively, we can calculate how many characters are stored in our trie. The first layer has 26, second layer has 26^2 nodes, third layer 26^3 nodes, fourth layer 26^4 nodes and fifth layer has 26^5 nodes. To store all 1,2,3,4,5 character URLs our trie will store the total number of nodes as follows:

26^5 + 26^4 + 26^3 + 26^2 + 26^1

So for all URLs of length n or fewer, we have:

26^n + 26^(n-1) + .. + 26^1

This is O(26^n). Using the Trie data structure, we saved a factor of n space in memory.
