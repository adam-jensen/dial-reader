dial-reader
===========

Reads analog needle gauges.

===========

matlab script asks the user to point out the center of a guage, and note down the extreme values.

Then it uses the hough transform to find the tip of the needle and output the value. 
It works by assuming that the needle is made of the longest straight lines in an image, and that those lines taper to/intersect at the tip. I extract the lines from the image using a bit of preprocessing and the hough transform. I learned about the hough transform from a French fellow's blog post about gauge reading: http://www.eissq.com/DialADC.html.

============

Run by seting a workspace variable named "initialized" to false, and then running TestReadNeedle
