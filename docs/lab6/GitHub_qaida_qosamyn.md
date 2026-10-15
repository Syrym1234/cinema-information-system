# 6-зертханалық жұмыс файлдарын GitHub-қа қосу

**Маңызды:** мына ZIP-ті жаңа репозиторий ретінде жүктемеңіз. Бар `cinema-information-system` қалтасына ашыңыз: ішіндегі `sql/` және `docs/` бумалары репозиторий бумаларымен бірігеді. `docs/` ішіндегі бұрынғы файлдарды өшірмеңіз.

### Git Bash — жоба түбірінде

```bash
git status
git switch -c feature/lab6-sql
git add sql/lab6 docs/lab6 README.md
git commit -m "feat: add lab6 cinema SQL database and JOIN queries"
git push -u origin feature/lab6-sql
```

`git add` алдында жобаның түбіріндегі `README.md` соңына төмендегі сілтеме бөлімін қосыңыз (оны алмастырмаңыз):

```markdown
## 6-зертханалық жұмыс — SQL Server

- [SQL кодтары, SELECT/JOIN мысалдары және ER-диаграмма](sql/lab6/README.md)
- [6-зертханалық жұмыстың Word есебі](docs/lab6/Lab6_Kinoteatr_esep.docx)
```

Соңында GitHub-та **Compare & pull request** → base `main`, compare `feature/lab6-sql` → **Create pull request** → **Merge pull request**. Біріктіруден соң Git Bash-та: `git switch main`, `git pull origin main`.

Егер `feature/lab6-sql` branch бұрыннан бар десе, жаңа атау таңдаңыз, мысалы `feature/lab6-sql-v2`. SQL құжаттарын қайтадан өшіріп-құрмаңыз.
