# Variables
CLUSTER_CONFIG = local-cluster.yaml

# Commands
CTPL_CLUSTER_UP = ctlptl apply -f $(CLUSTER_CONFIG)
TILT_UP = tilt up
CTPL_CLUSTER_DOWN = ctlptl delete -f $(CLUSTER_CONFIG)
TILT_DOWN = tilt down

# Targets
.PHONY: up down tilt-up tilt-down

# Spin up ctlptl cluster and run Tilt
up: ctlptl-up tilt-up

ctlptl-up:
	@echo "Spinning up ctlptl cluster with config: $(CLUSTER_CONFIG)"
	$(CTPL_CLUSTER_UP)

tilt-up:
	@echo "Starting Tilt..."
	$(TILT_UP)

# Spin down ctlptl cluster and Tilt
down: tilt-down ctlptl-down

tilt-down:
	@echo "Stopping Tilt..."
	$(TILT_DOWN)

ctlptl-down:
	@echo "Tearing down ctlptl cluster with config: $(CLUSTER_CONFIG)"
	$(CTPL_CLUSTER_DOWN)

