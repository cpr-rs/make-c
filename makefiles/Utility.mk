include $(CPR_MAKEFILES)/Colors.mk

ccjson:
	@echo "$(CYN)>$(RST) Regenerating compile_commands.json"
	@if ! command -v bear &> /dev/null; then \
		echo "$(RED)>$(RST) $(BOLD)bear$(RST) is not installed. Please install it to use this command."; \
		exit 1; \
	fi
	@bear --append -- $(MAKE) -s clean all
	@mv compile_commands.json build/

clean:
	@echo "$(CYN)>$(RST) Cleaning build objects"
	@rm -rf build
