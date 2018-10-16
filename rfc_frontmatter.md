% Title = "FFV1 Video Coding Format Version 0, 1, and 3"{V3}
% Title = "FFV1 Video Coding Format Version 4"{V4}
% abbrev = "FFV1"
% docName = "draft-ietf-cellar-ffv1-06"{V3}
% docName = "draft-ietf-cellar-ffv1-v4-03"{V4}
% category = "info"{V3}
% category = "std"{V4}
% ipr= "trust200902"
% area = "art"
% workgroup = "cellar"
% keyword = [""]
%
% [[author]]
% initials="M."
% surname="Niedermayer"
% fullname="Michael Niedermayer"
% [author.address]
% email="michael@niedermayer.cc"
%
% [[author]]
% initials="D."
% surname="Rice"
% fullname="Dave Rice"
% [author.address]
% email="dave@dericed.com"
%
% [[author]]
% initials="J."
% surname="Martinez"
% fullname="Jerome Martinez"
% [author.address]
% email="jerome@mediaarea.net"

.# Abstract

This document defines FFV1, a lossless intra-frame video encoding format. FFV1 is designed to efficiently compress video data in a variety of pixel formats. Compared to uncompressed video, FFV1 offers storage compression, frame fixity, and self-description, which makes FFV1 useful as a preservation or intermediate video format.

<reference anchor="ISO.15444-1.2016">
  <front>
    <title>Information technology -- JPEG 2000 image coding system: Core coding system</title>
    <author>
      <organization>International Organization for Standardization</organization>
    </author>
    <date month="October" year="2016" />
  </front>
</reference>

<reference anchor="ISO.14495-1.1999">
  <front>
    <title>Information technology -- Lossless and near-lossless compression of continuous-tone still images: Baseline</title>
    <author>
      <organization>International Organization for Standardization</organization>
    </author>
    <date month="December" year="1999" />
  </front>
</reference>

<reference anchor="ISO.14496-10.2014">
  <front>
    <title>Information technology -- Coding of audio-visual objects -- Part 10: Advanced Video Coding</title>
    <author>
      <organization>International Organization for Standardization</organization>
    </author>
    <date month="September" year="2014" />
  </front>
</reference>

<reference anchor="ISO.14496-12.2015">
  <front>
    <title>Information technology -- Coding of audio-visual objects -- Part 12: ISO base media file format</title>
    <author>
      <organization>International Organization for Standardization</organization>
    </author>
    <date month="December" year="2015" />
  </front>
</reference>

<reference anchor="range-coding">
  <front>
    <title>Range encoding: an algorithm for removing redundancy from a digitised message.</title>
    <author initials="G." surname="Nigel" fullname=""/>
    <author initials="N." surname="Martin" fullname=""/>
    <date month="July" year="1979" />
  </front>
  <seriesInfo name="Proc. Institution of Electronic and Radio Engineers International Conference on Video and Data Recording" value="" />
</reference>

<reference anchor="AVI" target="https://msdn.microsoft.com/en-us/library/windows/desktop/dd318189%28v=vs.85%29.aspx">
  <front>
    <title>AVI RIFF File Reference</title>
    <author>
      <organization>Microsoft</organization>
    </author>
    <date year="undated" />
  </front>
</reference>

<reference anchor="HuffYUV" target="https://web.archive.org/web/20040402121343/http://cultact-server.novi.dk/kpo/huffyuv/huffyuv.html">
  <front>
    <title>HuffYUV</title>
    <author initials="B." surname="Rudiak-Gould" fullname="Ben Rudiak-Gould"/>
    <date month="December" year="2003" />
  </front>
</reference>

<reference anchor="NUT" target="https://ffmpeg.org/~michael/nut.txt">
  <front>
    <title>NUT Open Container Format</title>
    <author initials="M." surname="Niedermayer" fullname="Michael Niedermayer"/>
    <date month="December" year="2013" />
  </front>
</reference>

<reference anchor="VALGRIND" target="https://valgrind.org/">
  <front>
    <title>Valgrind website</title>
    <author>
      <organization>Valgrind Developers</organization>
    </author>
    <date year="undated" />
  </front>
</reference>

<reference anchor="Address-Sanitizer" target="https://clang.llvm.org/docs/AddressSanitizer.html">
  <front>
    <title>ASAN AddressSanitizer website</title>
    <author>
      <organization>The Clang Team</organization>
    </author>
    <date year="undated" />
  </front>
</reference>

<reference anchor="REFIMPL" target="https://ffmpeg.org">
  <front>
    <title>The reference FFV1 implementation / the FFV1 codec in FFmpeg</title>
    <author initials="M." surname="Niedermayer" fullname="Michael Niedermayer"/>
    <date year="undated" />
  </front>
</reference>

<reference anchor="YCbCr" target="https://en.wikipedia.org/w/index.php?title=YCbCr">
  <front>
    <title>YCbCr</title>
    <author>
      <organization>Wikipedia</organization>
    </author>
    <date year="undated" />
  </front>
</reference>

<reference anchor="Matroska" target="https://datatracker.ietf.org/doc/draft-lhomme-cellar-matroska/">
  <front>
    <title>Matroska</title>
    <author>
      <organization>IETF</organization>
    </author>
    <date year="2016" />
  </front>
</reference>

<reference anchor="FFV1_V0" target="https://git.videolan.org/?p=ffmpeg.git;a=commit;h=b548f2b91b701e1235608ac882ea6df915167c7e">
  <front>
    <title>Commit to mark FFV1 version 0 as non-experimental</title>
    <author initials="M." surname="Niedermayer" fullname="Michael Niedermayer"/>
    <date month="April" year="2006" />
  </front>
</reference>

<reference anchor="FFV1_V1" target="https://git.videolan.org/?p=ffmpeg.git;a=commit;h=68f8d33becbd73b4d0aa277f472a6e8e72ea6849">
  <front>
    <title>Commit to release FFV1 version 1</title>
    <author initials="M." surname="Niedermayer" fullname="Michael Niedermayer"/>
    <date month="April" year="2009" />
  </front>
</reference>

<reference anchor="FFV1_V3" target="https://git.videolan.org/?p=ffmpeg.git;a=commit;h=abe76b851c05eea8743f6c899cbe5f7409b0f301">
  <front>
    <title>Commit to mark FFV1 version 3 as non-experimental</title>
    <author initials="M." surname="Niedermayer" fullname="Michael Niedermayer"/>
    <date month="August" year="2013" />
  </front>
</reference>

{mainmatter}
