# frozen_string_literal: true

module TimeHorizon
  class Person < StoreAdapter
    table :people

    schema(
      :name,
      :email
    )
  end
end
