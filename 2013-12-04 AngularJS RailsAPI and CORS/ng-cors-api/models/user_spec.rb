require 'spec_helper_model'

describe User do

  describe '#received_pending' do

    context 'given pending tasks', :pending_tasks do
      it 'returns the tasks' do
        expect(jack.received_pending).to have(3).tasks
      end
    end

    context 'given tasks in progress', :tasks_in_progress do
      it 'does not return the tasks' do
        expect(jack.received_pending).to have(0).tasks
      end
    end

    context 'given tasks awaiting approval', :tasks_awaiting_approval do
      it 'does not return the tasks' do
        expect(jack.received_pending).to have(0).tasks
      end
    end

    context 'given approved tasks', :approved_tasks do
      it 'does not return the tasks' do
        expect(jack.received_pending).to have(0).tasks
      end
    end
  end

  describe '#received_in_progress' do

    context 'given tasks in progress', :tasks_in_progress do
      it 'returns the tasks' do
        expect(jack.received_in_progress).to have(3).tasks
      end
    end

    context 'given pending tasks', :pending_tasks do
      it 'does not return the tasks' do
        expect(jack.received_in_progress).to have(0).tasks
      end
    end

    context 'given tasks awaiting approval', :tasks_awaiting_approval do
      it 'does not return the tasks' do
        expect(jack.received_in_progress).to have(0).tasks
      end
    end

    context 'given approved tasks', :approved_tasks do
      it 'does not return the tasks' do
        expect(jack.received_in_progress).to have(0).tasks
      end
    end
  end

  describe '#received_awaiting_approval' do

    context 'given tasks awaiting approval', :tasks_awaiting_approval do
      it 'returns the tasks' do
        expect(jack.received_awaiting_approval).to have(3).tasks
      end
    end

    context 'given pending tasks', :pending_tasks do
      it 'does not return the tasks' do
        expect(jack.received_awaiting_approval).to have(0).tasks
      end
    end

    context 'given tasks in progress', :tasks_in_progress do
      it 'does not return the tasks' do
        expect(jack.received_awaiting_approval).to have(0).tasks
      end
    end

    context 'given approved tasks', :approved_tasks do
      it 'does not return the tasks' do
        expect(jack.received_awaiting_approval).to have(0).tasks
      end
    end
  end

  describe '#sent_pending' do

    context 'given pending tasks', :pending_tasks do
      it 'returns the tasks' do
        expect(jill.sent_pending).to have(3).tasks
      end
    end

    context 'given tasks in progress', :tasks_in_progress do
      it 'does not return the tasks' do
        expect(jill.sent_pending).to have(0).tasks
      end
    end

    context 'given tasks awaiting approval', :tasks_awaiting_approval do
      it 'does not return the tasks' do
        expect(jill.sent_pending).to have(0).tasks
      end
    end

    context 'given approved tasks', :approved_tasks do
      it 'does not return the tasks' do
        expect(jill.sent_pending).to have(0).tasks
      end
    end
  end

  describe '#sent_in_progress' do

    context 'given tasks in progress', :tasks_in_progress do
      it 'returns the tasks' do
        expect(jill.sent_in_progress).to have(3).tasks
      end
    end

    context 'given pending tasks', :pending_tasks do
      it 'does not return the tasks' do
        expect(jill.sent_in_progress).to have(0).tasks
      end
    end

    context 'given tasks awaiting approval', :tasks_awaiting_approval do
      it 'does not return the tasks' do
        expect(jill.sent_in_progress).to have(0).tasks
      end
    end

    context 'given approved tasks', :approved_tasks do
      it 'does not return the tasks' do
        expect(jill.sent_in_progress).to have(0).tasks
      end
    end
  end

  describe '#sent_awaiting_approval' do

    context 'given tasks awaiting approval', :tasks_awaiting_approval do
      it 'returns the tasks' do
        expect(jill.sent_awaiting_approval).to have(3).tasks
      end
    end

    context 'given pending tasks', :pending_tasks do
      it 'does not return the tasks' do
        expect(jill.sent_awaiting_approval).to have(0).tasks
      end
    end

    context 'given tasks in progress', :tasks_in_progress do
      it 'does not return the tasks' do
        expect(jill.sent_awaiting_approval).to have(0).tasks
      end
    end

    context 'given approved tasks', :approved_tasks do
      it 'does not return the tasks' do
        expect(jill.sent_awaiting_approval).to have(0).tasks
      end
    end
  end

  describe '#received_completed_tasks' do

    context 'given pending tasks', :pending_tasks do
      it 'does not return the tasks' do
        expect(jack.received_completed_tasks).to have(0).tasks
      end
    end

    context 'given tasks in progress', :tasks_in_progress do
      it 'does not return the tasks' do
        expect(jack.received_completed_tasks).to have(0).tasks
      end
    end

    context 'given tasks awaiting approval', :tasks_awaiting_approval do
      it 'does not return the tasks' do
        expect(jack.received_completed_tasks).to have(0).tasks
      end
    end

    context 'given approved tasks', :approved_tasks do
      it 'returns the tasks' do
        expect(jack.received_completed_tasks).to have(3).tasks
      end
    end
  end

  describe '#sent_completed_tasks' do

    context 'given pending tasks', :pending_tasks do
      it 'does not return the tasks' do
        expect(jill.sent_completed_tasks).to have(0).tasks
      end
    end

    context 'given tasks in progress', :tasks_in_progress do
      it 'does not return the tasks' do
        expect(jill.sent_completed_tasks).to have(0).tasks
      end
    end

    context 'given tasks awaiting approval', :tasks_awaiting_approval do
      it 'does not return the tasks' do
        expect(jill.sent_completed_tasks).to have(0).tasks
      end
    end

    context 'given approved tasks', :approved_tasks do
      it 'returns the tasks' do
        expect(jill.sent_completed_tasks).to have(3).tasks
      end
    end
  end

  describe '#total_received_brownie_points' do

    context 'given completed tasks', :peter_paul_and_mary do

      before do
        [3, 4, 5].each do |points|
          create(:approved_task, requestee: peter, requester: paul, points: points)
        end
        [6, 7, 8].each do |points|
          create(:approved_task, requestee: peter, requester: mary, points: points)
        end
      end

      it 'returns the sum of points from all completed obligations' do
        expect(peter.total_received_brownie_points).to eq 33
      end
    end

    context 'given no completed tasks', :pending_tasks, :tasks_in_progress, :tasks_awaiting_approval do
      it 'returns 0' do
        expect(jack.total_received_brownie_points).to eq 0
      end
    end
  end

  describe '#total_sent_brownie_points' do

    context 'given completed tasks', :peter_paul_and_mary do

      before do
        [3, 4, 5].each do |points|
          create(:approved_task, requestee: peter, requester: mary, points: points)
        end
        [6, 7, 8].each do |points|
          create(:approved_task, requestee: paul, requester: mary, points: points)
        end
      end

      it 'returns the sum of points from all completed requests' do
        expect(mary.total_sent_brownie_points).to eq 33
      end
    end

    context 'given no completed tasks', :pending_tasks, :tasks_in_progress, :tasks_awaiting_approval do
      it 'returns 0' do
        expect(jill.total_sent_brownie_points).to eq 0
      end
    end
  end

  describe '#current_points_from', :peter_paul_and_mary do

    before do
      [3, 4, 5].each do |points|
        create(:approved_task, requestee: peter, requester: paul, points: points)
      end
      [6, 7, 8].each do |points|
        create(:approved_task, requestee: peter, requester: mary, points: points)
      end
    end

    it 'returns the sum of points from the given user' do
      expect(peter.current_points_from(paul.id)).to eq 12
      expect(peter.current_points_from(mary.id)).to eq 21
    end
  end

  describe '#sent_points', :peter_paul_and_mary do

    before do
      [3, 4, 5].each do |points|
        create(:approved_task, requestee: peter, requester: mary, points: points)
      end
      [6, 7, 8].each do |points|
        create(:approved_task, requestee: paul, requester: mary, points: points)
      end
    end

    it 'returns the sum of points sent to the given user' do
      expect(mary.sent_points(peter.id)).to eq 12
      expect(mary.sent_points(paul.id)).to eq 21
    end
  end
end
