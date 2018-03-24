STEM = letsencrypt-renew-tls-certs
BIN_DIR = /usr/local/sbin
SYSTEMD_DIR = /etc/systemd/system
RENEW_TIME = 5:40

all: install run-service

install: service timer
	mkdir -p $(BIN_DIR)
	install --mode=755 sh $(BIN_DIR)/$(STEM).sh
	install --mode=644 service $(SYSTEMD_DIR)/$(STEM).service
	install --mode=644 timer $(SYSTEMD_DIR)/$(STEM).timer

%: %.in
	sed -e 's|@BIN_DIR@|$(BIN_DIR)|;s|@STEM@|$(STEM)|;s|@RENEW_TIME@|$(RENEW_TIME)|' < $< > $@

run-service:
	systemctl daemon-reload
	systemctl start $(STEM).timer
	systemctl enable $(STEM).timer

uninstall:
	rm -rf $(BIN_DIR)/$(STEM).sh $(SYSTEMD_DIR)/$(STEM).*

clean:
	rm -f service timer

.PHONY: all install run-service uninstall clean
