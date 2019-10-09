%%%
title = "FFV1 Video Coding Format Version 0, 1, and 3"{V3}
title = "FFV1 Video Coding Format Version 4"{V4}
abbrev = "FFV1"
ipr= "trust200902"
area = "art"
workgroup = "cellar"
keyword = [""]

[seriesInfo]
name = "Internet-Draft"
stream = "IETF"
status = "informational"{V3}
status = "standard"{V4}
value = "draft-ietf-cellar-ffv1-10"{V3}
value = "draft-ietf-cellar-ffv1-v4-07"{V4}

[[author]]
initials="M."
surname="Niedermayer"
fullname="Michael Niedermayer"
  [author.address]
  email="michael@niedermayer.cc"

[[author]]
initials="D."
surname="Rice"
fullname="Dave Rice"
  [author.address]
  email="dave@dericed.com"

[[author]]
initials="J."
surname="Martinez"
fullname="Jerome Martinez"
  [author.address]
  email="jerome@mediaarea.net"
%%%

.# Abstract

This document defines FFV1, a lossless intra-frame video encoding format. FFV1 is designed to efficiently compress video data in a variety of pixel formats. Compared to uncompressed video, FFV1 offers storage compression, frame fixity, and self-description, which makes FFV1 useful as a preservation or intermediate video format.

{mainmatter}
