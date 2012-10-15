on run {input, parameters}
  repeat with i from 1 to count of input
    set theInput to item i of input
    set theFolder to theInput as alias
    set thePath to quoted form of POSIX path of theInput
    set theResults to do shell script "find -E " & thePath & " -type f -depth 1 -iregex '(.*).(mkv|mov|avi|mp4|m4v)'"

    set theLabelIndex to 0
    if (theResults is not equal to "") then
      set theLabelIndex to 2
      set isMeg to do shell script "find " & thePath & " -type f -depth 1 -name .meg"
      if (isMeg is not equal to "") then
        set theLabelIndex to 1
      end if
    end if

    tell application "Finder" to set label index of theFolder to theLabelIndex
  end repeat
  return input
end run
