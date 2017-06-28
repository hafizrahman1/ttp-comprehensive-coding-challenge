def sortByStrings(s,t)
  # convert string into arrays
  string = s.split(//)
  sampleString = t.split(//)
  result = []
  # iterate over the sampleString array and find the corresponding match of
  # characters to the given string array and push to the result if there is a match
  sampleString.each do |character|
    string.each do |chrc|
      if character == chrc
        result.push(chrc)
      end
    end
  end
  result.join("")
end
