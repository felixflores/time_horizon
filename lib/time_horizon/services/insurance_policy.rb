module TimeHorizon
  module Services
    class InsurancePolicy
      RECORDS = {
        '123456' => {
          carrier: 'Aetna',
          members: ['1234', '7890']
        }
      }

      def self.is_member?(policy_number:, member_id:)
        record = RECORDS[policy_number.to_s]
        !!(record && record[:members].include?(member_id))
      end
    end
  end
end
