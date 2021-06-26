const Attendees = artifacts.require("Attendees");

contract("Attendees", function ([owner, attendee1, attendee2]) {
  
  const mockName = 'Bob';
  const mediumTShirtSize = 1;

  let subject;

  beforeEach(async () => {
    subject = await Attendees.new();
  })

  it("should deploy the contract", async function () {
    return assert.isTrue(true);
  });

  it('user can declare attendance', async () => {

    await subject.declareAttendance(mockName, mediumTShirtSize, { from: attendee1 });
    
    const actualAttendees = await subject.getAllAttendees();
    
    expect(actualAttendees).to.deep.equal([attendee1]);
  })
  
  it('user can get their own info', async () => {
    
    await subject.declareAttendance(mockName, mediumTShirtSize, { from: attendee1 });

    const attendeeInfo = await subject.getMyInfo({ from: attendee1 });

    expect(attendeeInfo).to.deep.equal([mockName, mediumTShirtSize.toString()]);

  })

});
