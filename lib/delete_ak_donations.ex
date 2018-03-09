defmodule DeleteAkDonations do
  require Logger

  @print_interval 100

  def go do
    %{body: %{"meta" => %{"total_count" => count}}} = Ak.Api.get("donationaction")

    Logger.info("Count: #{count}")

    Ak.Api.stream("donationaction")
    |> Stream.with_index()
    |> Flow.from_enumerable(min_demand: 1, max_demand: 4, stages: 100)
    |> Flow.map(&delete_donation/1)
    |> Enum.to_list()
  end

  def delete_donation({donation, index}) do
    if rem(index, @print_interval) == 0 do
      Logger.info("Done #{index}")
    end

    delete_donation(donation)
  end

  def delete_donation(%{"id" => id}) do
    Ak.Api.delete("donationaction/#{id}")
  end
end
