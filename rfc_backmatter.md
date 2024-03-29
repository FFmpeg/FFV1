
{backmatter}

<reference anchor="ISO.9899.2018">
  <front>
    <title>Information technology - Programming languages - C</title>
    <author>
      <organization>International Organization for Standardization</organization>
    </author>
    <date year="2018" month="June"/>
  </front>
  <refcontent>ISO/IEC 9899:2018</refcontent>
</reference>

<reference anchor="ISO.15444-1.2019">
  <front>
    <title>Information technology -- JPEG 2000 image coding system: Core coding system</title>
    <author>
      <organization>International Organization for Standardization</organization>
    </author>
    <date  year="2019" month="October"/>
  </front>
  <refcontent>ISO/IEC 15444-1:2019</refcontent>
</reference>

<reference anchor="ISO.14495-1.1999">
  <front>
    <title>Information technology -- Lossless and near-lossless compression of continuous-tone still images: Baseline</title>
    <author>
      <organization>International Organization for Standardization</organization>
    </author>
    <date year="1999" month="December"/>
  </front>
  <refcontent>ISO/IEC 14495-1:1999</refcontent>
</reference>

<reference anchor="ISO.14496-10.2020">
  <front>
    <title>Information technology -- Coding of audio-visual objects -- Part 10: Advanced Video Coding</title>
    <author>
      <organization>International Organization for Standardization</organization>
    </author>
    <date year="2020" month="December"/>
  </front>
  <refcontent>ISO/IEC 14496-10:2020</refcontent>
</reference>

<reference anchor="ISO.14496-12.2020">
  <front>
    <title>Information technology -- Coding of audio-visual objects -- Part 12: ISO base media file format</title>
    <author>
      <organization>International Organization for Standardization</organization>
    </author>
    <date year="2020" month="December"/>
  </front>
  <refcontent>ISO/IEC 14496-12:2020</refcontent>
</reference>

<reference anchor="Range-Encoding">
  <front>
    <title>Range encoding: an algorithm for removing redundancy from a digitised message</title>
    <author initials="G. N. N." surname="Martin" fullname="G. N. N. Martin"/>
    <date year="1979" month="July"/>
  </front>
  <refcontent>Proceedings of the Conference on Video and Data Recording</refcontent>
  <refcontent>Institution of Electronic and Radio Engineers, Hampshire, England</refcontent>
</reference>

<reference anchor="AVI" target="https://docs.microsoft.com/en-us/windows/win32/directshow/avi-riff-file-reference">
  <front>
    <title>AVI RIFF File Reference</title>
    <author>
      <organization>Microsoft</organization>
    </author>
  </front>
</reference>

<reference anchor="HuffYUV" target="https://web.archive.org/web/20040402121343/http://cultact-server.novi.dk/kpo/huffyuv/huffyuv.html">
  <front>
    <title>HuffYUV revisited</title>
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

<reference anchor="Valgrind" target="https://valgrind.org/">
  <front>
    <title>Valgrind website</title>
    <author>
      <organization>Valgrind Developers</organization>
    </author>
  </front>
</reference>

<reference anchor="AddressSanitizer" target="https://clang.llvm.org/docs/AddressSanitizer.html">
  <front>
    <title>AddressSanitizer</title>
    <author>
      <organization>Clang Project</organization>
    </author>
  </front>
  <refcontent>Clang 12 documentation</refcontent>
</reference>

<reference anchor="REFIMPL" target="https://ffmpeg.org/doxygen/trunk/ffv1_8h.html">
  <front>
    <title>The reference FFV1 implementation / the FFV1 codec in FFmpeg</title>
    <author initials="M." surname="Niedermayer" fullname="Michael Niedermayer"/>
  </front>
</reference>

<reference anchor="FFV1GO" target="https://github.com/dwbuiten/go-ffv1">
  <front>
    <title>FFV1 Decoder in Go</title>
    <author initials="D." surname="Buitenhuis" fullname="Derek Buitenhuis"/>
    <date year="2019" />
  </front>
</reference>

<reference anchor="MediaConch" target="https://mediaarea.net/MediaConch">
  <front>
    <title>MediaConch</title>
    <author>
      <organization>MediaArea.net</organization>
    </author>
    <date year="2018" />
  </front>
</reference>

<reference anchor="YCbCr" target="https://en.wikipedia.org/w/index.php?title=YCbCr&amp;oldid=1025097882">
  <front>
    <title>YCbCr</title>
    <author>
      <organization>Wikipedia</organization>
    </author>
    <date month="May" day="25" year="2021"/>
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

# Multithreaded Decoder Implementation Suggestions

This appendix is informative.

The FFV1 bitstream is parsable in two ways: in sequential order as described in this document or with the pre-analysis of the footer of each Slice. Each Slice footer contains a `slice_size` field so the boundary of each Slice is computable without having to parse the Slice content. That allows multithreading as well as independence of Slice content (a bitstream error in a Slice header or Slice content has no impact on the decoding of the other Slices).

After having checked the `keyframe` field, a decoder **SHOULD** parse `slice_size` fields, from `slice_size` of the last Slice at the end of the `Frame` up to `slice_size` of the first Slice at the beginning of the `Frame` before parsing Slices, in order to have Slice boundaries. A decoder **MAY** fall back on sequential order e.g., in case of a corrupted `Frame` (e.g., frame size unknown or `slice_size` of Slices not coherent) or if there is no possibility of seeking into the stream.

# Future Handling of Some Streams Created by Nonconforming Encoders

This appendix is informative.

Some bitstreams were found with 40 extra bits corresponding to `error_status` and `slice_crc_parity` in the `reserved` bits of `Slice`. Any revision of this specification should avoid adding 40 bits of content after `SliceContent` if `version == 0` or `version == 1`, otherwise a decoder conforming to the revised specification could not distinguish between a revised bitstream and such buggy bitstream in the wild.

# FFV1 Implementations

This appendix provides references to a few notable implementations of FFV1.

## FFmpeg FFV1 Codec

This reference implementation [@REFIMPL] contains no known buffer overflow or cases where a specially crafted packet or video segment could cause a significant increase in CPU load.

The reference implementation [@REFIMPL] was validated in the following conditions:

* Sending the decoder valid packets generated by the reference encoder and verifying that the decoder's output matches the encoder's input.
* Sending the decoder packets generated by the reference encoder and then subjected to random corruption.
* Sending the decoder random packets that are not FFV1.

In all of the conditions above, the decoder and encoder was run inside the Valgrind memory debugger [@Valgrind] as well as the Clang AddressSanitizer [@AddressSanitizer], which tracks reads and writes to invalid memory regions as well as the use of uninitialized memory.  There were no errors reported on any of the tested conditions.

## FFV1 Decoder in Go

An FFV1 decoder [@FFV1GO] was written in Go by Derek Buitenhuis during the work to develop this document.

## MediaConch

The developers of the MediaConch project [@MediaConch] created an independent FFV1 decoder as part of that project to validate FFV1 bitstreams. This work led to the discovery of three conflicts between existing FFV1 implementations and draft versions of this document. These issues are addressed by (#exception), (#rgb-exception), and (#future-handling-of-some-streams-created-by-nonconforming-encoders).
