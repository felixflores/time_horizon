module TimeHorizon
  module Services
    class InsurancePolicies
      RECORDS = {
        '123456' => {
          carrier: 'Aetna',
          members: [1234, 7890]
        }
      }

      def self.is_members?(policy_number:, member_id:)
        record = RECORDS[policy_number.to_s]
        record[:members].include?(member_id) if record
      end
    end
  end
end
