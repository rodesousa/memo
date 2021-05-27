full_cicd:
	@mix clean
	@mix compile --warnings-as-errors
	@mix xref deprecated --abort-if-any
	@mix xref unreachable --abort-if-any
	@mix format --check-formatted
	@mix credo --strict
	@mix doctor --summary
	@mix test

dialyxir:
	@mix dialyzer

credo:
	@mix credo
