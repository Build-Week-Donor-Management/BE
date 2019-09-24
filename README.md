# BE
(This reads better if you read it in the Visual Studio Code applicaiton)

Here are the routes and their descriptions

And then again the routes that require a req.body, it shows them with the body

1	get (/donate)		                    shows each route, a sample body, and a description
2	get (/donate/member/user)		        shows the information for each member of type user
3	get (/donate/member/board)		        shows the information for each member of type board
4	get (/donate/member/campaign)		    shows the information for each member of type campaign
5	get (/donate/campaign)		            shows the information for each campaign
6	get (/donate/member)		            shows the information for each member
7	get (/donate/donor)		                shows the information for each donor
8	get (/donate/donation)		            shows the information for each donation
9	get (/donate/campaign/donation)		    shows the campaign id and donation id for each donation to a specific campaign
10	get (/donate/campaign/donate)		    shows the information for donations and the campaign information for each donation
11	get (/donate/campaign/donor)		    shows the information for each donor that constributed to a campaingn and the information for that campaign
12	get (/donate/camp/donor)		        shows the information for each donor that constributed to a campaingn and the name for that campaign
13	get (/donate/camp/don)		            shows the information for each campaign and the donations to it and the donor of the donation
14	delete (/donate/member/:id)		        deletes a member with a given id
15	delete (/donate/campaign/:id)		    deletes a campaign with a given id
16	delete (/donate/campaign/donattion/:id)	 deletes a record in the many to many donation ids and campaingn ids with a given id
17	delete (/donate/donor/:id)		         deletes a donor with a given id
18	delete (/donate/donation/:id)		     deletes a donation with a given id
19	post (/donate/donation)                	create a donation
20	post (/donate/donor)                	create a donor
21	post (/donate/campaign/donation)	 	create a record showing a donation id is linked to a particular campaign id
22	post (/donate/campaign)	            	create a campaign
23	put (/donate/donation/:id)          	update information about a donation
24	put (/donate/donor/:id)             	update information about a donor
25	put (/donate/member/:id)            	update information about a member
26	put (/donate/campaign/:id)          	update information about a campaign
27	put (/donate/campaign/donation/:id) 	update information about a donation id campaign id pairing
28	post (/donate/register/user)	    	create a member account of type user
29	post (/donate/register/board)	    	create a member account of type board
30	post (/donate/register/campaign)	 	create a member account of type campaign
31	post (/donate/login)	                deletes a donation with a given id

19	post (/donate/donation)
{description: '$5000 for Feed the Children',money: 1,value: 321, location: 'Feed the children campaign',date: '2019-09-21', donorid: 1 }
20	post (/donate/donor)
{name: 'Waldo Wayne',email: 'waldo@waldo.com',phone: '212-555-5555',address: '123 Park Lane, Geneva, WI',comdate: '2019-09-21',comtype: 'phone'}
21	post (/donate/campaign/donation)
{ donationid: 1, campaignid: 2 }
22	post (/donate/campaign)
{ name: 'Save the Whales', description: 'Stop people from killing whales', goal: 1000000 }
23	put (/donate/donation/:id)
{ description: '$5000 for Feed the Children', money: 1, value: 321, location: 'Feed the children campaign', date: '2019-09-21',donorid: 1 }
24	put (/donate/donor/:id)
{ name: 'Waldo Wayne', email: 'waldo@waldo.com', phone: '212-555-5555', address: '123 Park Lane, Geneva, WI', comdate: '2019-09-21', comtype: 'phone' }
25	put (/donate/member/:id)
{ username: 'user1', password: 'something', type: 'board',email: 'waldo@waldo.com',phone: '212-555-5555',address: '123 Park Lane, Geneva, WI' }
26	put (/donate/campaign/:id)
{name: 'Save the Whales', description: 'Stop people from killing whales', goal: 1000000 }
27	put (/donate/campaign/donation/:id)
{ donationid: 1, campaignid: 2 }
28	post (/donate/register/user)
{ username: 'user1', password: 'something',email: 'waldo@waldo.com',phone: '212-555-5555',address: '123 Park Lane, Geneva, WI'}
29	post (/donate/register/board)
{ username: 'user1', password: 'something',email: 'waldo@waldo.com',phone: '212-555-5555',address: '123 Park Lane, Geneva, WI'}
30	post (/donate/register/campaign)
{ username: 'user1', password: 'something',email: 'waldo@waldo.com',phone: '212-555-5555',address: '123 Park Lane, Geneva, WI' }
31	post (/donate/login)
{ username: 'user1', password: 'something' }
