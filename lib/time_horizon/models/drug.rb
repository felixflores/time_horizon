# frozen_string_literal: true

module TimeHorizon
  class Drug < StoreAdapter
    table :drugs

    schema(
      :name,
      :description
    )
  end
end
