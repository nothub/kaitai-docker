FROM debian:bullseye-slim

ARG KAITAI_VER=0.10
ARG KAITAI_DEB="kaitai-struct-compiler_${KAITAI_VER}_all.deb"
ARG KAITAI_SHA="2d8d9a4f72fa348bfff6f85a1b01802485bf20003f03e254ae37ffa362fdd398"
ARG KAITAI_URL="https://github.com/kaitai-io/kaitai_struct_compiler/releases/download/${KAITAI_VER}/${KAITAI_DEB}"

RUN apt-get update \
    && apt-get install --no-install-recommends --yes \
    ca-certificates \
    curl

RUN curl --location --output /tmp/${KAITAI_DEB} "${KAITAI_URL}" \
    && echo "${KAITAI_SHA} /tmp/${KAITAI_DEB}" | sha256sum -c - \
    && apt-get install --yes /tmp/${KAITAI_DEB} \
    && rm -f /tmp/${KAITAI_DEB}

ENTRYPOINT [ "ksc" ]
CMD [ "--help" ]
