# Persistent Path for Configuration File
mkdir -p /passion/prometheus
# Create a default Prometheus configuration file
cp ./prometheus-default.yml /passion/prometheus/prometheus.yml

# Create persistent volume for the data
docker volume create prometheus-data
# Start Prometheus container
docker run \
    -d \
    -p 9090:9090 \
    --name=prometheus \
    -v /passion/prometheus/prometheus.yml:/etc/prometheus/prometheus.yml \
    -v prometheus-data:/prometheus \
    prom/prometheus:latest