# FFV1 v4 goals and promises

- Cleanup of a few special cases that resulted out of bugs
- Better Compression and or Speed
- BAYER support to efficiently store RAW color CCD images
- Better error resilience
- Arbitrary color spaces
- Limit worst case size after compression

Anything that finds no volunteers will be pushed to v5


## Compression and Speed

Proposals are welcome, preferably with a patch to the FFmpeg implementation.
Proposals should come with a speed and compression comparison against FFV1 v3

Ideas
- Use the previous frames with motion estimation / compensation
- Neural network based compression


## Better error resilience

Proposals are welcome, preferably with a patch to the FFmpeg implementation.
Proposals should come with a PSNR per overhead and damage comparison of damaged streams

Ideas
- Include concealment motion vectors for each slice. This way if a slice is damaged the corresponding area from the previous frame can be used even if there is movement, this is very low overhead and quite simple
- Include a lossy compressed representation of the frame


## Arbitrary color spaces

Allow storage of any 2D plane of samples not limited to red, green, blue, alpha or transforms of these.

Examples:
- Infrared
- Radar
- surface vectors
- height
- age
- temperature
- charge
- elasticity
- velocity
- acceleration

This is mostly a question of metadata, the existing compression should be largely reusable. Of course compression could be fine tuned if any of these uses have non niche uses.
