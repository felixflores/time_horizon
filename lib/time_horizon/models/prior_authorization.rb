# frozen_string_literal: true

module TimeHorizon
  class PriorAuthorization < StoreAdapter
    table :prior_authorizations

    schema(
      :address,
      :carrier,
      :drug_id,
      :insurance_number,
      :name,
      :policy_number
    )
  end
end
