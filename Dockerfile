FROM public.ecr.aws/docker/library/node:20-slim
COPY --from=public.ecr.aws/awsguru/aws-lambda-adapter:0.9.1 /lambda-adapter /opt/extensions/lambda-adapter
ENV PORT=4010
WORKDIR "/var/task"
RUN npm install -g @stoplight/prism-cli
COPY openapi.yaml /var/task/openapi.yaml
CMD ["prism", "mock", "-h", "0.0.0.0", "openapi.yaml"]
