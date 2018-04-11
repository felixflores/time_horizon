# frozen_string_literal: true

module TimeHorizon
  class Review < StoreAdapter
    table :reviews

    schema(
      :prior_authorization_id,
      :received_at
    )
  end
end
