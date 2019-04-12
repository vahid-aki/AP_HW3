insert into Users values (0, '@milad', '09120000001', 'milad@gmail.com', crypt('milad94', gen_salt('bf')), 'milad', 'barazandeh', null, null, now(), now());

insert into Users values (1, '@sHDiV4RHs', '09129129122', 'mehdi@yahoo.com', crypt('mehdi123', gen_salt('bf')), 'mehdi', 'Naseri', null, null, now(), now());

insert into Users values (2, '@Ali', '09121111111', 'ali@aut.ac.ir', crypt('ali654', gen_salt('bf')), 'ali', 'Jahdi', null, null, now(), now());

insert into Users values (3, '@sahar', '09145678912', 'sahar19@gmail.com', crypt('sahar2019', gen_salt('bf')), 'Sahar', 'Sajadi', null, null, now(), now());

insert into Users values (4, '@hassan35', '09350350001', 'hassan35@yahoo.com', crypt('hassan987', gen_salt('bf')), 'Hassan', 'Salimi', null, null, now(), now());

insert into Users values (5, '@vahid_aki', '09144771793', 'vahidpourakbar@aut.ac.ir', crypt('vahid22', gen_salt('bf')), 'Vahid', 'Pourakbar', null, null, now(), now());

insert into Users values (6, '@pariwsa', '09359876543', 'pariwsa@aut.ac.ir', crypt('123parii', gen_salt('bf')), 'Pariwsa', 'Noori', null, null, now(), now());

insert into Users values (7, '@amir.jahanshahi', '09351111111', 'amir.jahanshahi@aut.ac.ir', crypt('2019amir', gen_salt('bf')), 'Amir', 'Jahanshahi', null, null, now(), now());

insert into Channel values (0, '@aut_ap_2019', 'Advanced Programming 2019', 'Programming channel for AP class 2019', '@milad', now(), now());

insert into Channel values (1, '@varzesh3', 'sport news', 'latest news in sport', '@hassan35', now(), now());

insert into Channel values (2, '@news', 'NEWS', 'latest news', '@sahar', now(), now());

insert into ChannelMembership values ('@milad', '@aut_ap_2019', now());

insert into ChannelMembership values ('@vahid_aki', '@aut_ap_2019', now());

insert into ChannelMembership values ('@sHDiV4RHs', '@aut_ap_2019', now());

insert into ChannelMembership values ('@pariwsa', '@aut_ap_2019', now());

insert into ChannelMembership values ('@amir.jahanshahi', '@aut_ap_2019', now());

insert into ChannelMembership values ('@milad', '@varzesh3', now());

insert into ChannelMembership values ('@hassan35', '@varzesh3', now());

insert into ChannelMembership values ('@hassan35', '@news', now());

insert into ChannelMembership values ('@pariwsa', '@news', now());

insert into ChannelMembership values ('@sahar', '@news', now());


insert into Message values (0, '@sHDiV4RHs', '@amir.jahanshahi', null, 'salam', now(), now());

insert into Message values (1, '@sHDiV4RHs', '@amir.jahanshahi', null, 'text_1', now(), now());

insert into Message values (2, '@amir.jahanshahi', '@sHDiV4RHs', null, 'text_2', now(), now());

insert into Message values (3, '@sHDiV4RHs', '@amir.jahanshahi', null, 'text_3', now(), now());

insert into Message values (4, '@amir.jahanshahi', '@sHDiV4RHs', null, 'text_4', now(), now());

insert into Message values (5, '@amir.jahanshahi', '@sHDiV4RHs', null, 'text_5', now(), now());

insert into Message values (6, '@sHDiV4RHs', '@amir.jahanshahi', null, 'text6', now(), now());

insert into Message values (7, '@amir.jahanshahi', '@sHDiV4RHs', null, 'text_7', now(), now());

insert into Message values (8, '@sHDiV4RHs', '@amir.jahanshahi', null, 'text_8', now(), now());

insert into Message values (9, '@amir.jahanshahi', '@sHDiV4RHs', null, 'text_9', now(), now());

insert into Message values (10, '@sHDiV4RHs', '@amir.jahanshahi', null, 'text_10', now(), now());

insert into Message values (11, '@sHDiV4RHs', '@amir.jahanshahi', null, 'text_11', now(), now());


insert into Message values (12, '@sHDiV4RHs', '@amir.jahanshahi', null, 'text_12', now(), now());

insert into BlockUser values ('@milad', '@hassan35', now());

insert into BlockUser values ('@milad', '@pariwsa', now());

insert into BlockUser values ('@milad', '@sahar', now());

insert into BlockUser values ('@sahar', '@hassan35', now());



 
