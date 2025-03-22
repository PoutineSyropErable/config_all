You should checkout the desktop or the laptop branch, as these are the branch for my personnal pc.
I recommend you use them, as this might not be updated at all

so:

```bash
git clone --branch desktop --depth 1 --recurse-submodules https://github.com/PoutineSyropErable/PoutineErable.config.git ~/.config_poutine/
```

Example:
https://www.youtube.com/watch?v=_ZSJtvB35-E

![Screenshot](https://github.com/PoutineSyropErable/home_for_git_public/raw/master/Pictures/Screenshot.png)

For full usage, you'll need to also download:
https://github.com/PoutineSyropErable/home_for_git_public
And put that in your /home.

Then the major breaking point is that I was too dumb to put $HOME in and put /home/francois in a bunch of scripts because ~ doesn't always works. So, I'll need to modify that and upload gradually, in my free time. After that, you will need to
install the appropriate software.

If you aren't on Arch, it might be a nightmare just to get the dependancies. Ubuntu was horrible for that, it was legit quicker to switch distro and reinstall everything then get some dependancies.

update -- It's back!!!
Yeah at 3 am after hours of cleaning up and trying to add it to github, I had an non existant file that stop pushing. So I asked how to remove files from github history and i got how to remove, end of sentence.

here's a command you should never do: git filter-repo --path <path-to-remove> --invert-paths --force

Testdisk didn't help much, but luckily, i had a backup in hidden in my system partition somewhere that was rather recent.

---

I'm kinda doxing myself but hey... Let's rip the bandaid
My name is François, I live in Québec, Canada. If you didn't get the Poutine au Sirop D'érable name joke, here it is.

<details>
  <summary>Click to reveal spoiler</summary>
So basically I wanted people to know I speak french, more precisly Canadian French but there's a running gag that those who put QC in their username didn't pass highschool. I mean, imagine if 10% had USA in their username... So I went and mixed all the local stereotypes.

it's like an american called "Gun wielding bald Eagle", british->"Tea drinking coloniser", Australian->"Inverted Jailed Kangouroos".

</details>

<details>
  <summary>Click to reveal spoiler</summary>
https://en.wikipedia.org/wiki/Poutine
https://fr.wikipedia.org/wiki/Sirop_d%27%C3%A9rable
https://en.wikipedia.org/wiki/Flag_of_Quebec
</details>

So with that, my profile pic is explained.

So, I'll upload a ~/home directories so you can reproduce this.
Pictures, Videos, .mpd and other are needed. (Python_main_Environment)
Music Too

Though I'll have to remove the songs due to copy right reasons.

also main problem is lots of these files have /home/francois, at some point i might switch it to $HOME.
