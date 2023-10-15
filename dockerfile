# Install the .NET Core tool as before
FROM mcr.microsoft.com/dotnet/core/sdk as builder

RUN dotnet tool install --global dotnet-ef	

ENV PATH="/root/.dotnet/tools:${PATH}"

# Use the smaller runtime image
FROM ghcr.io/ldest/sre-course/api:f0135e1

# Copy the binaries across, and set the path
COPY --from=builder /root/.dotnet/tools/ /usr/local/bin

ENTRYPOINT ["bash"]
