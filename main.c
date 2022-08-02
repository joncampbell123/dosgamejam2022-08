
#include <sys/types.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "zlib.h"

int main() {
#if 1//TEST
	{
		unsigned char *inbuf = malloc(4096);
		unsigned char *outbuf = malloc(16384);
		z_stream *z = malloc(sizeof(z_stream));

		if (z == NULL) return 1;
		if (inbuf == NULL) return 1;
		if (outbuf == NULL) return 1;

		memset(z,0,sizeof(*z));
		memset(outbuf,0,16384);

		{
			int r;
			int fd = open("testing.gz",O_RDONLY|O_BINARY);
			if (fd < 0) fd = open("..\\testing.gz",O_RDONLY|O_BINARY);
			if (fd < 0) return 2;
			r = read(fd,inbuf,4096);
			if (r <= 0) return 2;
			z->next_in = inbuf;
			z->avail_in = r;
			z->next_out = outbuf;
			z->avail_out = 16384;
			close(fd);
		}

		if (inflateInit2(z,15/*window*/+32/*gzip*/) != Z_OK) return 3;

		{
			int r = inflate(z,Z_FINISH);
			if (!(r == Z_OK || r == Z_STREAM_END)) return 4;
		}

		if (inflateEnd(z) != Z_OK) return 5;

		printf("%s\n",outbuf);

		free(outbuf);
		free(inbuf);
		free(z);
	}
	return 0;
#endif

	return 0;
}

