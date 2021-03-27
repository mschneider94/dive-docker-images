FROM wagoodman/dive:latest
RUN apk add --no-cache bash
COPY main.sh /
ENTRYPOINT ["bash"]
CMD ["./main.sh"]
