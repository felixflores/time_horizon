# frozen_string_literal: true

module TimeHorizon
  class Credential < StoreAdapter
    table :credentials

    schema(
      :role,
      :person_id
    )
  end
end
